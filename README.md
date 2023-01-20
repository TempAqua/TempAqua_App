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





## PosgreSQL

We use docker to install PostgreSQL / Postgis. It can be install in a local machine or and a remote server.

⚠️ Please note that the device hosting PostgreSQL must have a static IP adress and must be connected to the internet.

Installation steps :

1. to do with docker compose



Load data sample : 

1. to do with docker compose



## Qfield cloud

To do



## QGIS

1. Download and Install the latest version from the [official web page](https://www.qgis.org/en/site/forusers/download.html).

2. In QGIS, open the plugin library and search for **qfield sync**. Select
   the plugin in the list and click on **Install**.
   
   ![ ](doc\static\qfield-sync_install.png)





## Qfield

Install the app on your mobile. Installation guide [here](https://docs.qfield.org/get-started).  



## 
