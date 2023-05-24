
> [Main page](../README.md)

# User guide

## Deploy QGIS project on QFieldCloud

These few steps should only be performed once during the project initialization process.

1. Create an emplty folder where you want to store the project

2. Start QGIS (an empty project)

3. From QGIS, open the template project as follow : 
   
   - In QGIS > Browser > GeoPackage
     ![   ](doc/static/deploy_step3.png)
   
   - Right click > New Connection ... > open `.../TempAqua_App/qgis/TempAqua.gpkg`
   
   - In `TempAqua.gpkg` > Double click `TempAqua` to open the project
     
     Loading the TempAqua template project provides access to fictitious data that can be edited as desired.

4. Convert the project to QField project:
   
   - In QGIS > Browser > QFieldCloud > My projects
   - Right click > Create new project
     ![   ](doc/static/deploy_step4.png)
   - Convert currently open project to cloud project (recommended)
   - Click next and fill the required information
   - Chose you local folder
   - Close QGIS

5. Fix cloud settings in project:
   
   - Open the newly created QGIS project
   - In Layers planel > Right click on the segments layer > Properties 
        ![   ](doc/static/deploy_step5.png)
   - In QField tab > change Cloud layer action to `Directly access data source`

6. Push changes to QFieldCloud:
   
   - Save project
   - Menu `Plugins` > `QFieldSync` > `Synchronize Current Cloud Project`







## Processing scripts

We developed a set of scripts to automate the data collection process. These scripts are located in the `/qgis/` folder. The following sections describe how to use these scripts.

Installation process can be found [here](INSTALLATION.md).


### TempAqua_archiving.py

This script performs the following actions:

- It validates the project by ensuring that it contains at least four layers, with at least two layers ending with '_archive', and at least two layers with names containing "media".
- It transfers new or modified features from the normal table to the archived counterpart.

![tt](static/tempAqua_archiving.png)


To run a script without logs

1. double click on the script 

To run a script with a log:

1. Right-click on the script.
2. Select "Edit Script...".
3. In the code window, click on the green arrow in the menu bar above.
4. Click "Run" on the new window that appears.




