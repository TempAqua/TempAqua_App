> [Main page](../README.md)



# Installation

The following are the steps to install and utilize the TempAqua app, using a sample project as an example. After completing the installation process, users will have the capability to create their own data collection tool.


### QGIS

1. Download and Install the latest version (>= 3.30) from the [official web page](https://www.qgis.org/en/site/forusers/download.html).

2. In QGIS, open the plugin library and search for **qfield sync**. Select
   the plugin in the list and click on **Install**.
   ![   ](doc/static/qfield-sync_install.png)


### Get the Code

Option 1 : With git

    **⚠️ Requirement : git must be installed on your computer**

    Clone the repository: 

    `git clone https://github.com/TempAqua/TempAqua_App.git`

Option 2 : Download the zip file 

    Download [this file](https://github.com/TempAqua/TempAqua_App/archive/refs/heads/main.zip) and unzip it on you local machine. 


### Create QFieldCloud account

Visit the web page of https://qfield.cloud/ and follow the intructions. 

A Pro account is a prerequisite for :

* sharing your project privately among different users while being in the field.

* having 1 GB of disk space in the cloud (100 MB for the free version). Uploading videos could use a lot of data.  

### Install QField on your mobile device

To install, please follow [this link](https://docs.qfield.org/get-started/).





### QGIS processing script installation

To install the processing script, follow these steps:

1. In QGIS, with the project open, go to Processing > Toolbox.
2. On the second icon from the left, select “Add a script to Toolbox…”.
3. Navigate to the `/qgis/` folder and select the python script.

The script will appear at the bottom of the window.
