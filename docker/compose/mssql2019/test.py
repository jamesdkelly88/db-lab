import pyodbc
import os

password = os.environ['SECRET_PASSWORD']
host = os.environ['DOMAIN']
port = 1434
username = "sa"

cnxn = pyodbc.connect("Driver={ODBC Driver 18 for SQL Server};"
                      f"Server={host},{port};"
                      "Database=master;"
                      f"UID={username};"
                      f"PWD={password};"
                      "TrustServerCertificate=yes;")


cursor = cnxn.cursor()
cursor.execute('SELECT @@VERSION AS Version')

for row in cursor:
    print(row[0])