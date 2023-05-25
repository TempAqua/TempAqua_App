
> [Main page](../README.md)

# User guide

This page give information on how to use the TempAqua application.


## Project content

The TempAqua QGIS projects and layers are included into the `/qgis/TempAqua.gpkg` geopackage. 

![tt](static/qgis_gpk.png)



Two QGIS projects are available:
*  ![tt](static/qgis_small.png) TempAqua_manager : This the project to gather data from field collection, it contains archived tables.

* ![tt](static/qgis_small.png) TempAqua_Qfield : This is the project to be used to set up mobile surveys. It contains the same layers as the TempAqua_manager project, but without the archived tables. It is also configured to be used with QFieldCloud.




## How to work with TempAqua ? 


The standard process for working with TempAqua is as follows: 

1. [Step 0 : Initialize the QGIS project for the survey](#Step-0-:-Initialize-the-QGIS-project-for-the-survey)


Schema of these steps :



![tt](static/process.png)



## Step 0 : Initialize the QGIS project for the survey

### Initial publication

> These few steps should only be performed once during the project initialization process.

1. Create an emplty folder where you want to store the project

2. Start QGIS (an empty project)

3. From QGIS, open the template project as follow : 
   
   - In QGIS > Browser > GeoPackage
     ![   ](static/deploy_step3.png)
   
   - Right click > New Connection ... > open `.../TempAqua_App/qgis/TempAqua_Qfield.gpkg`
   
   - In `TempAqua.gpkg` > Double click `TempAqua` to open the project
     
     Loading the TempAqua template project provides access to fictitious data that can be edited as desired.

4. Convert the project to QField project:
   
   - In QGIS > Browser > QFieldCloud > My projects
   - Right click > Create new project
     ![   ](static/deploy_step4.png)
   - Convert currently open project to cloud project (recommended)
   - Click next and fill the required information
   - Chose you local folder
   - Close QGIS

5. Fix cloud settings in project:
   
   - Open the newly created QGIS project
   - In Layers planel > Right click on the segments layer > Properties 
        ![   ](static/deploy_step5.png)
   - In QField tab > change Cloud layer action to `Directly access data source`

6. Push changes to QFieldCloud:
   
   - Save project
   - Menu `Plugins` > `QFieldSync` > `Synchronize Current Cloud Project`




## Step 1 : Set up the QFieldCloud project


### Remove existing attributes

> We developed a set of scripts to automate the data collection process. These scripts are located in the `/qgis/` folder. The following sections describe how to use these scripts. Installation process can be found [here](INSTALLATION.md).

This `TempAqua_empty_table.py` script allows the user to empty all attributes in a table except for the primary key and geometry. This can be useful when starting a new survey and wanting to clear the table to start from scratch while maintaining the measurement positions.


To run a script

1. double click on the script. The following window will appear:
![tt](static/tempAqua_archiving_3.png)
2. Select the layer you want to empty.
3. Click on `Run` button. The script will run and a log will be displayed in the window. 




### Publish a existing QGIS project and data on QFieldCloud


> These few steps is performed when the QGIS project has already been published on QFieldCloud and you want to update it.


1. On GIS, click `Plugins` > `QFieldSync` > `Synchronize Current Cloud Project`

2. On the window that appears, click `Prefer Local` button. This will upload the local project to QFieldCloud and overwrite the existing project.

3. Click `Perform Action` button

   ![   ](static/qgisfiledcloud_1.png)





## Step 2 : QfieldCloud project management

Please refer to the [official documentation](https://docs.qfield.org/get-started/tutorials/get-started-qfc/) for more information on how to manage QFieldCloud projects.




## Step 3 : Qfield 

Please refer to the [official documentation](https://docs.qfield.org/get-started/) for more information on how to manage QField projects on the mobile devices.



## Step 4 : Get the data from QFieldCloud to QGIS

To get the data from your field data collection, you need to download the data from QFieldCloud to QGIS. This is done as follow:

1. On GIS, click `Plugins` > `QFieldSync` > `Synchronize Current Cloud Project`

2. On the window that appears, click `Prefer Cloud` button. 

3. Click `Perform Action` button




## Step 5 : Data processing / achariving

### Archive the survey data

> We developed a set of scripts to automate the data collection process. These scripts are located in the `/qgis/` folder. The following sections describe how to use these scripts. Installation process can be found [here](INSTALLATION.md).


This script performs the following actions:

- It validates the project by ensuring that it contains at least four layers, with at least two layers ending with '_archive', and at least two layers with names containing "media".
- It transfers new or modified features from the normal table to the archived counterpart.

![tt](static/tempAqua_archiving.png)


To run a script


1. From the `QGIS survey project` copy the table you want to archive and paste it in the `QGIS manager project`. 
1. double click on the script. The following window will appear:
![tt](static/tempAqua_archiving_2.png)
2. Add optional information to be saved in the archived table. This information can be used to describe the survey or any changes made.
3. Click on `Run` button. The script will run and a log will be displayed in the window. The log will indicate the number of features that have been archived.








