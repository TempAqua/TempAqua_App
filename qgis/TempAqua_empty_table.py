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
import sqlite3
from qgis.PyQt.QtCore import QCoreApplication
from qgis.core import (QgsProcessing,
                       QgsFeatureSink,
                       QgsProcessingException,
                       QgsProcessingAlgorithm,
                       QgsProcessingParameterFeatureSource,
                       QgsProject,
                       QgsProcessingParameterFeatureSink)
from qgis import processing

FIELDS_NOT_OT_EMPTY = ['fid', 'geom']


class TempAquaEmptyAttributes(QgsProcessingAlgorithm):
    """
    This script implements a QGIS Processing algorithm to remove all the attributes of a layer but keep the geometry and the primary key.
    """

    # Constants used to refer to parameters and outputs. They will be
    # used when calling the algorithm from another algorithm, or when
    # calling from the QGIS console.

    INPUT = 'INPUT'

    def tr(self, string):
        """
        Returns a translatable string with the self.tr() function.
        """
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return TempAquaEmptyAttributes()

    def name(self):
        """
        Returns the algorithm name.
        """
        return "tempaqua_empty_attributes"

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any
        user-visible display of the algorithm name.
        """
        return self.tr('TempAqua empty attributes')

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
        return "tempaqua_empty_attributes"

    def shortHelpString(self):
        """
        Returns a localised short helper string for the algorithm.
        """
        description = f""" \
        This script implements a QGIS Processing algorithm for emptying attributes \
        """

        return self.tr(description)

    def initAlgorithm(self, config=None):
        """
        inputs and output of the algorithm, along
        with some other properties.
        """

        # We add the input vector features source. It can have any kind of
        # geometry.
        self.addParameter(
            QgsProcessingParameterFeatureSource(
                self.INPUT,
                self.tr('Input layer'),
                [QgsProcessing.TypeVectorAnyGeometry]
            )
        )


    def empty_feature_attributes(self,layer,feedback) :
        feedback.setProgressText(f"layer : {layer} ")
        layer_path, table_name = layer.source().split("|")
        table_name = table_name.split("=")[1]
        
        conn = sqlite3.connect(layer_path)
        conn.enable_load_extension(True)
        conn.load_extension("mod_spatialite")
        
        
        cursor = conn.cursor()
        query = f"PRAGMA table_info({table_name})"
        cursor.execute(query)
        results = cursor.fetchall()

        # Extract the field names from the results
        field_names = [row[1] for row in results]
        
        field_names_to_update = [field for field in field_names if field not in FIELDS_NOT_OT_EMPTY ]
        
        query = f"UPDATE {table_name} SET "
        query += ', '.join(f"{column} = NULL" for column in field_names_to_update )
        cursor.execute(query)

        conn.commit()
        conn.close()
        
        
        
        feedback.setProgressText(f"field_names : {field_names_to_update} ")
        
        
        
        


    def processAlgorithm(self, parameters, context, feedback):
        """
        Run the algorithm.
        """

        # Retrieve the feature source and sink. The 'dest_id' variable is used
        # to uniquely identify the feature sink, and must be included in the
        # dictionary returned by the processAlgorithm function.
        source = self.parameterAsSource(
            parameters,
            self.INPUT,
            context
        )
        
        layer_name = source.sourceName()
        project = QgsProject.instance()
        layer = project.mapLayersByName(layer_name)[0]
        
        
        
        self.empty_feature_attributes(layer,feedback)
        
        
        

        
        

        return {}
