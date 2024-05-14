import psycopg2
import os

password = os.environ['SECRET_PASSWORD']
host = os.environ['DOMAIN']
port = 5436

try:
    conn = psycopg2.connect(f"dbname='postgres' user='postgres' host='{host}' port={port} password='{password}'")
except:
    print("I am unable to connect to the database")
    quit()

with conn.cursor() as curs:

    try:
        curs.execute("SELECT version()")
        single_row = curs.fetchone()
        print(f"{single_row}")
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)