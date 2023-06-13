# -*- coding: utf-8 -*-

"""
***************************************************************************
*                                                                         *
*   This program is free software; you can redistribute it and/or modify  *
*   it under the terms of the GNU General Public License as published by  *
*   the Free Software Foundation; either version 2 of the License, or     *
*   (at your option) any later version.                                   *
*                                                                         *
***************************************************************************
"""
from datetime import datetime
import sqlite3
from qgis.PyQt.QtCore import QCoreApplication
from qgis.core import (
    QgsProcessingException,
    QgsProcessingAlgorithm,
    QgsProject,
    QgsWkbTypes,
    QgsProcessingParameterFeatureSource,
    QgsProcessingParameterString,
    QgsProcessingParameterDefinition,
    QgsProcessing,
)

from qgis.PyQt.QtWidgets import QMessageBox

ARCHIVE_SUFFIX = "_archive"
PK_NAME = "fid"
DIFFERENCE_FIELD = "difference"
TIMESTAMP_FIELD = "timestamp_archive"
USER_FIELD = "user"
INFO_FIELD = "info_archive"

class TempAquaArchiving(QgsProcessingAlgorithm):
    """
    This script implements a QGIS Processing algorithm for archiving changed features
    """

    INPUT = 'INPUT'
    OUTPUT = 'OUTPUT'
    INFO_TEXT = 'INFO_TEXT'

    def tr(self, string):
        """
        Returns a translatable string with the self.tr() function.
        """
        return QCoreApplication.translate("Processing", string)

    def createInstance(self):
        return TempAquaArchiving()

    def name(self):
        """
        Returns the algorithm name.
        """
        return "tempaqua_archiving"

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any
        user-visible display of the algorithm name.
        """
        return self.tr("TempAqua archiving")

    def group(self):
        """
        Returns the name of the group this algorithm belongs to. This string
        should be localised.
        """
        return self.tr(
            f"TempAqua"
        )

    def groupId(self):
        """
        Returns the unique ID of the group this algorithm belongs to.
        """
        return "tempaqua_archiving"

    def shortHelpString(self):
        """
        Returns a localised short helper string for the algorithm.
        """

        description = f""" \
        This script implements a QGIS Processing algorithm for archiving changed features \
        from normal layers to archive layers (*{ARCHIVE_SUFFIX}) in a QGIS project. \
        It ensures the project is valid, identifies the layers to be archived,  \
        and transfers missing features between the corresponding layers based on certain conditions."""

        return self.tr(description)

    def initAlgorithm(self, config=None):
        
        self.addParameter(
            QgsProcessingParameterFeatureSource(
                self.INPUT,
                self.tr('Input layer'),
                [QgsProcessing.TypeVector]
            )
        )
        
        self.addParameter(
            QgsProcessingParameterFeatureSource(
                self.OUTPUT,
                self.tr('Output layer (archive)'),
                [QgsProcessing.TypeVector]
            )
        )
        
        
        self.addParameter(QgsProcessingParameterString(
            self.INFO_TEXT,
            'Survey info :',
            defaultValue= None,
            optional=True        
        ))

    def get_layer_list(self):
        """
        Get the list of layer in the QGIS Project
        """
        # Get the list of layers in the current QGIS project
        project = QgsProject.instance()
        layers = project.mapLayers()

        # Extract the layer names
        layer_list = [layer.name() for layer in layers.values()]

        return layer_list



    def validate_project(self, feedback):
        """
        Check that the project has at least 4 layers.
        """
        list_of_layers = self.get_layer_list()

        if len(list_of_layers) < 4:
            raise QgsProcessingException(
                "Qgis project should contain at least 4 layers"
            )

        if len([i for i in list_of_layers if i.endswith(ARCHIVE_SUFFIX)]) < 2:
            raise QgsProcessingException(
                f"Qgis project should contain at least 2 layers ending with {ARCHIVE_SUFFIX}"
            )

        if len([i for i in list_of_layers if "media" in i]) < 2:
            raise QgsProcessingException(
                "Qgis project should contain at least 2 layers name media* "
            )

        list_of_archive_layers = [
            i for i in list_of_layers if i.endswith(ARCHIVE_SUFFIX)
        ]
        list_of_expected_current_layers = [
            i.split(ARCHIVE_SUFFIX)[0] for i in list_of_archive_layers
        ]

        if not all(
            element in list_of_layers for element in list_of_expected_current_layers
        ):
            raise QgsProcessingException(
                f"Qgis project should contain at least these layers {list_of_expected_current_layers}, current list of layer {list_of_layers}"
            )

        feedback.setProgressText("QGIS project is valid")

    def validate_io(self, input , output  ,feedback): 
        
        # Check input layer is geopackage
        storage_type = input.dataProvider().storageType()
        if storage_type != "GPKG" :
            feedback.reportError(f'The input layer must be in Geopackage format. Currently {storage_type}')
            
        # Check output layer is geopackage
        storage_type = output.dataProvider().storageType()
        if storage_type != "GPKG" :
            feedback.reportError(f'The output layer must be in Geopackage format. Currently {storage_type}')
    

        # Check that the input and output layer name are not identical
        if input.name() == output.name():
            feedback.reportError('Input and output layer names cannot be identical.')
            
        
        # Check that the schema of input should be found insinde the output
        input_fields = [field.name() for field in input.fields()]
        output_fields = [field.name() for field in output.fields()]
        missing_field = [field for field in input_fields if field not in output_fields ]
        if missing_field :
           feedback.reportError(f'Fields {missing_field} from {input.name()} has not been found in {output.name()}') 

               
        
    
    def infer_layers_pairs(self, list_of_layers_name: list) -> list:
        """Infer layers pairs from list of layers name

        Parameters
        ----------
        list_of_layers_name : list
            list of layers name in a QGIS project

        Returns
        -------
        list
            List of tuple containing current layer name and archive layer name
        """

        list_of_archive_layers = [
            i for i in list_of_layers_name if i.endswith(ARCHIVE_SUFFIX)
        ]
        list_of_current_layers = [
            i.split(ARCHIVE_SUFFIX)[0] for i in list_of_archive_layers
        ]

        return list(zip(list_of_current_layers, list_of_archive_layers))

    def features2dict(self, layer: object) -> list:
        """Tansform layer features to list of dict

        Parameters
        ----------
        layer : QgsVectorLayer
            Layer object to transform

        Returns
        -------
        list
            list of dict containing layer features attributes and geometry.
        """

        feat_list_dict = []
        for feat in layer.getFeatures():
            feat_field_values = feat.attributes()
            feat_field_names = feat.fields().names()
            feat_field_dict = {
                field_name: attribute
                for field_name, attribute in zip(feat_field_names, feat_field_values)
            }
            feat_list_dict.append(feat_field_dict)
            if layer.geometryType() != QgsWkbTypes.NullGeometry:
                feat_geometry = feat.geometry()
                feat_wkt = feat_geometry.asWkt()
                feat_field_dict["geom"] = feat_wkt

        return feat_list_dict

    def insert_feature(self, layer, list_data, feedback):
        layer_path, table_name = layer.source().split("|")
        table_name = table_name.split("=")[1]
        feedback.setProgressText(f"Geopackage file path : {layer_path} ")

        connection = sqlite3.connect(layer_path)
        connection.enable_load_extension(True)
        connection.load_extension("mod_spatialite")
        cursor = connection.cursor()
        for data in list_data:
            field_name = [i for i in data.keys()]
            field_name_str = ",".join(field_name)
            field_values = [str(i) for i in data.values()]
            field_values = [None if item == "NULL" else item for item in field_values]
            if "geom" in field_name:
                geom_index = field_name.index("geom")
                geom_value = field_values[geom_index]
                geom = connection.execute(
                    "SELECT GeomFromText(?, 4326)", (geom_value,)
                ).fetchone()[0]
                field_values[geom_index] = geom

            placeholders = "(" + ", ".join(["?" for _ in field_name]) + ")"

            query = f"INSERT INTO {table_name} ({field_name_str}) VALUES {placeholders}"
            cursor.execute(query, tuple(field_values))
        connection.commit()
        connection.close()

    def get_most_recent_element(self, data):
        most_recent_element = None
        most_recent_date = None

        for element in data:
            observed_at = element[TIMESTAMP_FIELD]
            observed_date = datetime.strptime(observed_at, "%d/%m/%Y %H:%M:%S")

            if most_recent_date is None or observed_date > most_recent_date:
                most_recent_element = element
                most_recent_date = observed_date

        return most_recent_element

    def compare_dicts(
        self, dict1: dict, dict2: dict, blacklist_keys: list = []
    ) -> dict:
        """Compare two dictionaries and return the differences.

        Parameters
        ----------
        dict1 : dict
            Base dictionary
        dict2 : dict
            Compared dictionary
        blacklist_keys : list, optional
            List of keys to used in the comparaison, by default []

        Returns
        -------
        dict
            Dictionary of differences
        """

        keys = set(dict1.keys()) | set(dict2.keys())

        differences = {
            key: (dict1.get(key), dict2.get(key))
            for key in keys
            if key not in blacklist_keys and dict1.get(key) != dict2.get(key)
        }

        return differences

    def transfer_missing_features(
        self, layer_in: str, layer_out: str, feedback,parameters
    ) -> None:
        """Transfer missing features from in_layer to out_layer.

        Parameters
        ----------
        in_layer : str
            Input layer name
        out_layer : str
            Output layer name
        """
        
        

        feedback.setProgressText(f"Layer in : {layer_in.name()}")
        feedback.setProgressText(f"Layer out : {layer_out.name()}")
        
        
        # Qgis feature to list of dict
        feat_in_list_dict = self.features2dict(layer_in)
        feat_out_list_dict = self.features2dict(layer_out)
        feat_out_list_pk = [
            feat.get(f"{PK_NAME}{ARCHIVE_SUFFIX}") for feat in feat_out_list_dict
        ]

        list_feat_to_insert = list()
        

        for feat_in in feat_in_list_dict:
            feat_in_pk = feat_in.get(PK_NAME)
            feedback.setProgressText(f"Feature {PK_NAME} = {str(feat_in_pk)}")

            # Rename pk
            feat_to_insert = feat_in.copy()
            feat_to_insert[f"{PK_NAME}{ARCHIVE_SUFFIX}"] = feat_to_insert.get(PK_NAME)
            del feat_to_insert[PK_NAME]

            # Add timestamp
            feat_to_insert[TIMESTAMP_FIELD] = datetime.now().strftime(
                "%d/%m/%Y %H:%M:%S"
            )

            #Add info field
            info_text = parameters[self.INFO_TEXT] 
            if info_text:
                feat_to_insert[INFO_FIELD] = info_text


            # New feature
            if feat_in_pk not in feat_out_list_pk:
                list_feat_to_insert.append(feat_to_insert)

            # Existing feature
            else:
                feats_archive_existing = [
                    i
                    for i in feat_out_list_dict
                    if i.get(f"{PK_NAME}{ARCHIVE_SUFFIX}") == feat_in_pk
                ]

                feat_recent_archive_existing = self.get_most_recent_element(
                    feats_archive_existing
                )
                diff = self.compare_dicts(
                    dict1=feat_recent_archive_existing,
                    dict2=feat_to_insert,
                    blacklist_keys=[PK_NAME, TIMESTAMP_FIELD,USER_FIELD,DIFFERENCE_FIELD,INFO_FIELD],
                )

                # No change on the feature
                if not diff:
                    feedback.setProgressText("-> No difference have been found ")
                # With change on the feature
                else:
                    feedback.setProgressText(f"--> Difference have been found {diff} ")
                    feat_to_insert[DIFFERENCE_FIELD] = str(diff)
                    list_feat_to_insert.append(feat_to_insert)

        # Save the changes into the geopackage
        if list_feat_to_insert:
            self.insert_feature(layer_out, list_feat_to_insert, feedback)
            
            
    

    def processAlgorithm(self, parameters, context, feedback):
        """
        Run the algorithm.
        """

            
        
        input = self.parameterAsSource(
            parameters,
            self.INPUT,
            context
        )
        output = self.parameterAsSource(
            parameters,
            self.OUTPUT,
            context
        )
        
        layer_in_name = input.sourceName()
        layer_out_name = output.sourceName()
        
        project = QgsProject.instance()
       
   
        layer_in = project.mapLayersByName(layer_in_name)[0]
        layer_out = project.mapLayersByName(layer_out_name)[0]
      

        
        self.validate_io(input = layer_in, 
            output = layer_out,
            feedback=feedback )


        # Run processing
        self.transfer_missing_features(layer_in, layer_out, feedback,parameters)

        return {}
