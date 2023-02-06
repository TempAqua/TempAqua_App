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

Docker and Git must both be installed on the system and have internet access. It should be configured in such a way that it is accessible through a fixed IP address for ease of use and to ensure link with Qfield.



# Steps

The installation process involves these steps:

1. [Install the PostgreSQL DB.](PostgreSQL) 

2. [Install QGIS.](QGIS)

3. [Clone the repository.](Get-the-code)

4. [Define user parameters.](Define-user-parameters) 

5. [Create QGIS project.](Create-QGIS-project) 

6. [Create Qfieldcloud account.](Qfield-cloud)

7. [Install Qfield on your mobile device.](Qfield)

8. [Link QfiledCloud and the DB.](Link-Qfield-cloud-and-database)



### PosgreSQL

We use docker to install PostgreSQL / Postgis. It can be install in a local machine or and a remote server.

Installation steps :

1. Move into the TempAqua folder
   
   `cd TempAqua`

2. Copy the `.env_template` into `.env` and add with a text editor the *POSTGRES_USER* and *POSTGRES_PASSWORD*

3. Run the docker-compose
   
   `docker-compose up -d`

`docker run -d -p 5432:5432 --name postgis postgis/postgis`

Upon completion of the prvious tasks, you will have the ability to connect to the PostgreSQL database utilizing your preferred database administration tool. Sample dataset is loaded during this intallation process.

DB acces and crendentials :

- Address : localhost or the name/IP of the machine you install PsotgeSQL in.

- DB name : tempaqua

- Schema : tempaqua_sample

- DB Admin User : the one define in the .env file

- DB Admin password: the one define in the .env file



**SSL certificates**

Installing SSL certificates on websites is important for ensuring secure transmission of data by encrypting the data transmitted between the user's web browser and the website. It also helps to build trust and credibility with users by verifying the website's identity and ensuring that the connection is secure.

Installation steps :

1. Download and install OpenSSL.

2. Go to the folder `./cert`



### QGIS

1. Download and Install the latest version from the [official web page](https://www.qgis.org/en/site/forusers/download.html).

2. In QGIS, open the plugin library and search for **qfield sync**. Select
   the plugin in the list and click on **Install**.



## Get the Code

Installation steps :

1. Clone the repository.`git clone https://github.com/TempAqua/TempAqua_App.git`



### Define user parameters

(DB credentials + naming) in `.env` file.



### Create QGIS project

Run python scripts within QGIS to set up table and Qgis project.



## Qfield cloud

To do

##

## Qfield

Install the app on your mobile. Installation guide [here](https://docs.qfield.org/get-started).  

## 

### Link Qfield cloud and database

![ ](doc\static\qfield-sync_install.png)
