# TempAqua_App

Data and code related to the ENAC-IT4R OS Grant proposal, period Nov 2022 - Jun 2023

# Introduction

The TempAqua App allows for detailed mapping of temporal streams  and other ecohydrological features, as well as for documenting physical variables and soft data. 

The  application is configurable; users can import their maps and data, e.g., pre-defined observation  locations, landscape features such as stream networks and catchments boundaries. 

With this, the  App helps users to navigate in complex terrain and to collect data at the correct locations. The  data collection with the TempAqua App is straightforward and intuitive: The users navigate to  interesting locations based on their current position and imported maps. Then, they enter the  observations, such as stream state, discharge, water level, comments, photos, and even movies through the GUI. 

The App automatically connects stream sections, color codes them depending on  the flow state and shows them on the map so that the users immediately see the progress of their survey. The App  does not require an internet connection during data collection. An internet connection is only  needed once when, after the survey, the users export their data directly to the database. 

The App also syncs previoulsy exported surveys, so that all  users with access to the same database can immediately retrieve information about previous  surveys, which assures consistency in data collection when several researchers collect data for  the same project in the same region.

# Applicative architecture

![ ](doc\static\applicative_architecture.png)

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

## Requirement

Docker and Git must both be installed on the system and have internet access. It should be configured in such a way that it is accessible through a fixed IP address for ease of use and to ensure link with QField.



# Steps

The installation process involves these steps:

1. [Install the PostgreSQL DB.](PostgreSQL) 

2. [Install QGIS.](QGIS)

3. [Clone the repository.](Get-the-code)

4. [Define user parameters.](Define-user-parameters) 

5. [Create QGIS project.](Create-QGIS-project) 

6. [Create QFieldCloud account.](QFieldCloud)

7. [Install QField on your mobile device.](QField)

8. [Link QFieldCloud and the DB.](Link-QFieldCloud-and-database)



### PosgreSQL

We use Docker to install PostgreSQL / PostGIS. It can be installed on a local machine or remote server.

You can deploy the dockerised PostgreSQL from the related project [TempAqua_DB](https://github.com/EPFL-ENAC/TempAqua_DB)


### QGIS

1. Download and Install the latest version from the [official web page](https://www.qgis.org/en/site/forusers/download.html).

2. In QGIS, open the plugin library and search for **qfield sync**. Select
   the plugin in the list and click on **Install**.

3. Add required python libraries
   - Open OSGeo4W shell (packed with QGIS in the start menu)
   - Use Python’s pip to install the libraries:
     - `pip install -U python-dotenv`
   - Re-launch QGIS



## Get the Code

Installation steps :

1. Clone the repository: `git clone https://github.com/TempAqua/TempAqua_App.git`

### Define user parameters

(DB credentials + naming) in `.env` file.

### Create PostGIS schema, table, role and import sample data
1. In QGIS, open the `./empty.qgs` project.
2. Go to `Project Home` and run create_schema_and_user.py

### Create QGIS project

1. Go to `Project Home` and run setup_proj.py
2. Open the project `./qfield/tempaqua_sample_project.qgs`

## QFieldCloud

To do

##

## QField

Install the app on your mobile. Installation guide [here](https://docs.qfield.org/get-started).  

## 

### Link QFieldCloud and database

![ ](doc\static\qfield-sync_install.png)

