# Installation

The following are the steps to install and utilize the TempAqua app, using a sample project as an example. After completing the installation process, users will have the capability to create their own data collection tool.

**Steps**

The installation process involves these steps:

1. [Install QGIS.](#1-QGIS)

2. [Get the project code](#2-Get-the-code)

3. [Create QFieldCloud account](#3-Create-QFieldCloud-account)

4. [Install QField on your mobile device.](#4-Install-QField-on-your-mobile-device)

5. [Deploy QGIS project on QFieldCloud](#5-deploy-qgis-project-on-qfieldcloud)



### 

### 1. QGIS

1. Download and Install the latest version (>= 3.30) from the [official web page](https://www.qgis.org/en/site/forusers/download.html).

2. In QGIS, open the plugin library and search for **qfield sync**. Select
   the plugin in the list and click on **Install**.
   ![   ](doc/static/qfield-sync_install.png)

### 

### 2. Get the Code

Option 1 : With git

    **⚠️ Requirement : git must be installed on your computer**

    Clone the repository: 

    `git clone https://github.com/TempAqua/TempAqua_App.git`

Option 2 : Download the zip file 

    Download [this file](https://github.com/TempAqua/TempAqua_App/archive/refs/heads/main.zip) and unzip it on you localmchaine. 

### 3. Create QFieldCloud account

Visit the web page of https://qfield.cloud/ and follow the intructions. 

A Pro account is a prerequisite for :

* sharing your project privately among different user on the field.

* having 1 GB of disk space in the cloud (100 MB for the free version). Uploading videos could be heavy.  

### 4. Install QField on your mobile device

To install, please follow [this link](https://docs.qfield.org/get-started/).

### 5. Deploy QGIS project on QFieldCloud

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

