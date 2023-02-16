#!/usr/bin/env python

import os
import psycopg2
from psycopg2.extensions import AsIs
from dotenv import dotenv_values  # type: ignore
from qgis.core import QgsProject  # type: ignore

CURRENT_DIRECTORY = QgsProject.instance().readPath("./")

config = dotenv_values(os.path.join(CURRENT_DIRECTORY, ".env"))


def import_sql_file(file_path):
    # Read sql file
    sql = open(file_path, "r").read()

    # Connect to database
    conn = psycopg2.connect(
        host=config["POSTGRES_HOST"],
        database=config["POSTGRES_DB"],
        user=config["POSTGRES_USER"],
        password=config["POSTGRES_PASSWORD"],
    )

    cursor = conn.cursor()
    cursor.execute(
        sql,
        {
            "db": AsIs(config["POSTGRES_DB"]),
            "schema": AsIs(config["TEMPAQUA_SCHEMA"]),
            "user": AsIs(config["TEMPAQUA_USER"]),
            "pass": config["TEMPAQUA_PASSWORD"],
        },
    )

    conn.commit()
    conn.close()


import_sql_file(
    os.path.join(CURRENT_DIRECTORY, "database", "create_tables_and_user.sql")
)
import_sql_file(
    os.path.join(CURRENT_DIRECTORY, "QField_sample_data", "insert_sample_data.sql")
)

print("Database schema and user created")
