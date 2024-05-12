import psycopg2

# TODO - env var for password, hostname, port
try:
    conn = psycopg2.connect("dbname='postgres' user='postgres' host='localhost' password='P@ssw0rd'")
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