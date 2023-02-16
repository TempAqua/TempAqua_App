#!/usr/bin/env python

import os
from dotenv import dotenv_values  # type: ignore
from qgis.core import QgsProject  # type: ignore

CURRENT_DIRECTORY = QgsProject.instance().readPath("./")

config = dotenv_values(os.path.join(CURRENT_DIRECTORY, ".env"))

# Read template qgs file
qgs = open(
    os.path.join(CURRENT_DIRECTORY, "qgis", "tempaqua_sample_project.qgs"), "r"
).read()

# For each environment variable, replace it in the qgs file
for key, val in config.items():
    qgs = qgs.replace("${" + key + "}", val)

# Write qgs file
qgs_file = open(
    os.path.join(CURRENT_DIRECTORY, "qgis", "tempaqua_sample_project.qgs"), "w"
)
qgs_file.write(qgs)
qgs_file.close()
