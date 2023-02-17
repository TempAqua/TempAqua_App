# TempAqua_App

Data and code related to the ENAC-IT4R OS Grant proposal, period Nov 2022 - Jun 2023

# Introduction

The TempAqua App allows for detailed mapping of temporal streams  and other ecohydrological features, as well as for documenting physical variables and soft data. 

The  application is configurable; users can import their maps and data, e.g., pre-defined observation  locations, landscape features such as stream networks and catchments boundaries. 

With this, the  App helps users to navigate in complex terrain and to collect data at the correct locations. The  data collection with the TempAqua App is straightforward and intuitive: The users navigate to  interesting locations based on their current position and imported maps. Then, they enter the  observations, such as stream state, discharge, water level, comments, photos, and even movies through the GUI. 

The App automatically connects stream sections, color codes them depending on  the flow state and shows them on the map so that the users immediately see the progress of their survey. The App  does not require an internet connection during data collection. An internet connection is only  needed once when, after the survey, the users export their data directly to the database. 

The App also syncs previoulsy exported surveys, so that all  users with access to the same database can immediately retrieve information about previous  surveys, which assures consistency in data collection when several researchers collect data for  the same project in the same region.

# Applicative architecture

![tt](doc/static/applicative_architecture.png)

The system is composed with the following elements : 

* **QGIS** : open-source desktop geographic information system (GIS) software.

* **PostgreSQL** : open-source object-relational database management system (ORDBMS).

* **PostGIS**  :  open-source spatial database extender for the PostgreSQL 
  relational database management system. It adds spatial capabilities, 
  such as the ability to store and query spatial data, to PostgreSQL, 
  making it a powerful tool for geographic information systems (GIS) and 
  other spatial data applications.

* **QField**  : open-source mobile GIS application for Android and Iphone. It is designed to work with QGIS. QField allows users to take their QGIS projects into the field, collecting and editing data.

* **QFieldCloud** : a service that allows users to synchronize and share their QGIS projects and data with QField,

# Installation

The following are the steps to install and utilize the TempAqua app, using a sample project as an example. After completing the installation process, users will have the capability to create their own data collection tool.

**Steps**

The installation process involves these steps:

1. [Install the PostgreSQL DB.](#PostgreSQL) 

2. [Install QGIS.](#QGIS)

3. [Get the project code](#Get-the-code)

4. [Define user parameters.](#Define-user-parameters) 

5. [Create the PostgreSQL table](#Create-the-PostgreSQL-table) 

6. [Create QGIS project](#Create-QGIS-project) 

7. [Create QFieldCloud account](#Create-QFieldCloud-account)

8. [Install QField on your mobile device.](#Install-QField-on-your-mobile-device)

9. [Link QFieldCloud and the data base](#Link_QFieldCloud_and_the_data_base)

### 

### PostgreSQL

You can use any PostgreSQL / PostGIS data base. 

**⚠️ Requirement : the data base must me accessed from the internet  (should be configured in such a way that it is accessible through a fixed IP address).**

If you don't have already a PostgreSQL / PostGIS data base. You can  deploy the dockerised PostgreSQL from the related project [TempAqua_DB](https://github.com/EPFL-ENAC/TempAqua_DB).

### QGIS

1. Download and Install the latest version from the [official web page](https://www.qgis.org/en/site/forusers/download.html).

2. In QGIS, open the plugin library and search for **qfield sync**. Select
   the plugin in the list and click on **Install**.
   ![   ](doc/static/qfield-sync_install.png)

3. Add required python libraries
   
   - Open `OSGeo4W shell` (packed with QGIS in the start menu)
   - Use Python’s pip to install the libraries:
     - `pip install -U python-dotenv`
   - Re-launch QGIS 

### 

### Get the Code

Option 1 : With git

    **⚠️ Requirement : git must be installed on your computer**

    Clone the repository: 

    `git clone https://github.com/TempAqua/TempAqua_App.git`

Option 2 : Download the zip file 

    Download [this file](https://github.com/TempAqua/TempAqua_App/archive/refs/heads/main.zip) and unzip it on you locla mchaine. 



### Define user parameters

In this stage, you will establish the parameters for your project. This is a crucial step because the parameters you input will be utilized to generate the data table in the database, as well as the corresponding Qgis project.

Steps :

1. Copy and paste the file `.env_template` into `.env`

2. Open the file `.env` with a text editor (eg. notepad++)

3. Edit the values for the following paramters : 

| Parameter name    | Description                                                                     | Example             |
| ----------------- | -------------------------------------------------------------------------------- | ------------------- |
| POSTGRES_HOST     | Host of the data base.                                                           | tempaqua.epfl.ch    |
| POSTGRES_PORT     | Port of the data base.                                                           | 5432                |
| POSTGRES_SSLMODE  | Sslmode of the data base.                                                        | ? Usefull here ???? |
| POSTGRES_DB       | Name of the data base                                                            | ? Usefull here ???? |
| POSTGRES_USER     | Admin user name of the data base. Used for the creation of the data base.        | super_admin         |
| POSTGRES_PASSWORD | Admin user password  of the data   base. Used for the creation of the data base. | dfgdfhgdfh          |
| TEMPAQUA_DB       | Name of the data base that will store the project                                | tempaqua            |
| TEMPAQUA_SCHEMA   | Name of the schema that will store the project                                   | tempaqua            |
| TEMPAQUA_USER     | User name for the project. Used for the data collection                          | tempaqua_user       |
| TEMPAQUA_PASSWORD | User password  for the project.   Used for the data collection                   | dglkjhdfkl44        |
| DUMP_LOCATION     | Location of the database dump                                                    | ? Usefull here ???? |
| SSL_CERT_KEY      | Key of the data base.                                                            | ? Usefull here ???? |
| SSL_CERT_CRT      | Crt of the data base.                                                            | ? Usefull here ???? |

### Create the PostgreSQL table

In this stage, you will create the table in the database and load sample data. 

Steps : 

1. From the project root folder, open the Qgis project `empty.qgz`.

2. In the browser, Go to `Project Home` and run `create_schema_and_user.py`
	![   ](doc/static/run_code.png)

### Create QGIS project

Having completed the previous step of creating and loading the table, we are now able to proceed with the creation of the Qgis project.

Step :

1. From the project root folder, open the Qgis project `empty.qgz`.

2. In the browser, Go to `Project Home` and run `run setup_proj.py`

3. Open the project `./qfield/tempaqua_sample_project.qgs`

### Create QFieldCloud account

To do

 

### Install QField on your mobile device

To install, please follow [this link](https://docs.qfield.org/get-started/).

### Link QFieldCloud and the data base

Todo
