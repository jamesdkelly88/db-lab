# Database Types

There are 15 common types of database[^1]. This lab attempts to include examples of all of them, as well as sample databases which can be used to demonstrate their use cases.

![15 types of database](https://substackcdn.com/image/fetch/$s_!PvX_!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06ea11e0-0161-4f3c-a2ed-99c766b261a6_1944x1148.png)

I'm a big fan of [PostgreSQL](https://www.postgresql.org/) for several reasons - one of these is that it can actually be used as all 15 of these types. This page includes a list of the 15, as well as how to use them in PostgreSQL. Using PostgreSQL may not be the best solution for each case, but the simple fact that it can be all 15 at the same time at least makes it worth considering, just like a Swiss Army Knife cannot replace a toolbox, but is still worth having around.

## The Types

### 1. Relational

What most people think of when you say 'database'. Tables of rows and columns containing structured data. PostgreSQL is a relational database management system (RDBMS) so can do this natively.

### 2. Key-Value

Data stored as a list of unique keys, and a value for each key. The value can be complex in some engines (also see #3). PostgreSQL is able to provide a key-value store using the `hstore` extension[^2], which is included by default.

```sql
-- install the extension in the database
CREATE EXTENSION hstore;

-- create a table
CREATE TABLE books (
  id serial primary key,
  title VARCHAR(255)
  attr hstore
);

-- add some data
INSERT INTO books (title, attr)
VALUES ('Around the World in Eighty Days','"Author" => "Jules Verne","Published" => 1872,"ISBN" => "979-8688580884"');

-- query the data
SELECT id,title,attr->'Author' AS Author,attr->'Published' AS Published FROM books;

 id |              title              |   author    | published 
----+---------------------------------+-------------+-----------
  1 | Around the World in Eighty Days | Jules Verne | 1872
(1 row)
```

### 3. Document

A variation of a key-value store where the value is a document (typically XML or JSON). PostgreSQL supports the JSON and XML[^4] data types natively, so can provide this functionality.

```sql
-- create JSON table
CREATE TABLE person(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,info JSONB);
-- insert JSON document
INSERT INTO person (info)
VALUES('{"name": "John Doe", "age": 35, "city": "San Francisco"}');
-- query JSON document
SELECT info->>'name' AS name FROM person; -- ->> coerces the result to text, otherwise it would be surrounded by ""

-- create XML table
CREATE TABLE person(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,info XML);
-- insert XML document
INSERT INTO person (info)
VALUES (
    XMLPARSE(DOCUMENT '<?xml version="1.0" encoding="UTF-8"?>
    <person>
        <name>John Doe</name>
        <age>35</age>
        <city>San Francisco</city>
    </person>')
);
-- query XML document
SELECT (xpath('/person/name/text()', info))[1]::text AS name FROM person;


   name   
----------
 John Doe
```

### 4. Graph

A graph database is used to handle highly related data. Unlike a relational database, the joins (relationships) between data items (nodes) are part of the database schema. PostgreSQL provides a graph database, which can be queried with Cypher, using the Apache AGE extension[^5].

```sql
EXAMPLE TBC
```

### 5. Wide-Column

Wide-column stores are designed for partitioning large amounts of data with a flexible column structure across multiple machines. The Citus extension[^6] provides a way of running distributed PostgreSQL. Combining this with JSON/XML columns to store data allows for a more flexible schema than a traditional table. 

```sql
EXAMPLE TBC
```

### 6. In-Memory

In-memory databases store their data in-memory (surprise!) rather than on disk, for faster response times. The OrioleDB extension[^7] provides a new database storage type that makes use of this approach. There is also the pg-mem project[^8], which offers an in-memory instance of PostgreSQL running in Node.js.

```sql
EXAMPLE TBC
```

### 7. Time-Series

A time-series database specialises in storing and retrieving timestamped data, such as logs or sensor readings. The TimescaleDB extention can be installed to give PostgreSQL this capability. It is included in the `postgres-full` image in this repository.

```sql
EXAMPLE TBC
```

### 8. Object-Oriented

Object-oriented databases store application data in the same structure as the application uses it, removing the need for object-relational mapping (ORM). PostgreSQL is officially an ORDBMS (object relational database management system), so provides some of these features, with the added benefit of a query language, which an OODBMS would not have.

!!! note "This brilliant answer from StackOverflow explains it better than I could[^9]"

    One of the situations where the object-oriented approach is visible is the fact that for each table there is a corresponding data type created. So a table is essentially a set of "instances" of a specific type.

    You can even explicitly define a table like that:

    ```sql
    create type person_type as (id integer, firstname text, lastname text);
    create table person of person_type;
    ```
    Type inheritance is only supported for table types, not for base types:
    ```sql
    create table person (id integer, firstname text, lastname text);
    create table person_with_dob
    ( 
    dob date
    ) inherits (person);
    ```
    This is however not fully object oriented because the type definition lacks the ability to defined methods on the type (=class) including method visibility. The closest thing to a type method is a function with that type as the parameter:
    ```sql
    create table person (id integer, firstname text, lastname text);

    create function fullname(p_row person) returns text
    as
    $$
    select concat_ws(' ', p_row.firstname, p_row.lastname);
    $$ 
    language sql;

    insert into person (id, firstname, lastname) values (42, 'Arthur', 'Dent');
    ```
    Now you can run:
    ```sql
    select p.fullname
    from person p;
    ```
    and it returns:
    ```
    fullname   
    -----------
    Arthur Dent
    ```
    even though there is no column named fullname in the table person. This behaviour is the closest to a real class/type method found in object oriented languages (but it's not the same thing as it still lacks the ability to define e.g. private methods)

    Creating user defined structured data types is typically also seen as an object oriented feature:
    ```sql
    create type address_type (city text, zipcode text, street text);

    create table person
    (
    id integer primary key,
    firstname text,
    lastname text, 
    billing_address address_type, 
    shipping_address address_type
    );
    ```
    Arrays can also be seen as "sets of objects" however this is not necessarily an object oriented feature.

### 9. Text Search

Text search databases are designed for indexing and retrieving from large volumes of unstructured / semi-structured text. PostgreSQL (since v12) has a built in full-text search capability using the `tsvector` type[^10].

```sql
-- create a table
CREATE TABLE nursery_rhymes(
    id serial primary key,
    title varchar(255),
    content text,
    ts tsvector GENERATED ALWAYS AS (to_tsvector('english', content)) STORED
);
-- index the text-search column
CREATE INDEX ts_idx ON nursery_rhymes USING GIN (ts);
-- insert data
INSERT INTO nursery_rhymes(title,content) VALUES
    ('Humpty Dumpty','Humpty Dumpty sat on a wall. Humpty Dumpty had a great fall. All the king''s horses and all the king''s men Couldn''t put Humpty together again.'),
    ('Baa Baa Black Sheep','Baa, baa, black sheep, Have you any wool? Yes, sir, yes, sir, Three bags full; One for the master, And one for the dame, And one for the little boy Who lives down the lane.');
-- query data
SELECT title
FROM nursery_rhymes
WHERE ts @@ to_tsquery('english','horse');

     title     
---------------
 Humpty Dumpty
(1 row)
```

### 10. Spatial

Spatial databases store geographical information such as points, polygons and shapes. The PostGIS extension[^11] (included in `postgres-full`) includes specialised types and functions that allow the use of this type of data.

```sql
EXAMPLE TBC
```

### 11. Blob

Blob (binary large objects) can be stored in PostgreSQL using the `BYTEA` datatype[^12] (size limit of 1GB). For very large objects, PostgreSQL has additonal functions for LOBs[^13]. Unlike `BYTEA` columns, LOBs are stored in a dedicated table (`pg_largeobject`) and are cross-referenced into other tables by their lobjId (`oid` type). The maximum size of a LOB stored this way is 4TB.

```sql
EXAMPLE TBC
```

### 12. Ledger

Ledger / blockchain databases are immutable, and only allow appending of records. Through a combination of time-series and other data types, PostgreSQL is able to offer a compatible structure for a ledger table[^14]. The use of database permissions or triggers can provide the required immutability[^15].

```sql
EXAMPLE TBC
```

### 13. Hierarchical

Hierarchical data has a tree-like structure, with each record having a single parent and zero, one or many children. PostgreSQL has the `ltree` extension, which is included by default and provides types and methods for handling hierarchy data.

```sql
-- install ltree
CREATE EXTENSION ltree;
-- create table
CREATE TABLE places(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    path ltree NOT NULL
);
-- add some data
INSERT INTO places(name,path)
VALUES ('World','world'),('UK','world.europe.uk'),('London','world.europe.uk.london'),('Oxford Street','world.europe.uk.london.w1d.oxford_street');
-- query the data
SELECT name FROM places WHERE path <@ 'world.europe'; -- get descendents

 id |     name      |                   path                   
----+---------------+------------------------------------------
  1 | World         | world
  2 | UK            | world.europe.uk
  3 | London        | world.europe.uk.london
  4 | Oxford Street | world.europe.uk.london.w1d.oxford_street
(4 rows)

SELECT name FROM places WHERE path @> 'world.europe.uk.london'; -- get ancestors

  name  
--------
 World
 UK
 London
(3 rows)

SELECT * FROM places WHERE nlevel(path) = 3; -- get paths with 3 labels (elements)

 id | name |      path       
----+------+-----------------
  2 | UK   | world.europe.uk
(1 row)

SELECT * FROM places WHERE path ~ '*.uk.*'; -- get places in the UK using wildcards
```

### 14. Vector

Vector databases store arrays of numbers which represent data in many dimensions. The pgvector extension (included in `postgres-full`) add the `vector` type and related functions.

```sql
EXAMPLE TBC
```

### 15. Embedded

Embedded databases run within an application, rather than as a separate (often remote) service, to reduce complexity and resource usage. The pglite project[^19] provides an embedded PostgreSQL instance using WebAssembly. Their homepage even has an instance running on it which you can run queries against!



[^1]: [15 Types of Databases and When to Use Them](https://blog.algomaster.io/p/15-types-of-databases)
[^2]: [PostgreSQL hstore](https://neon.com/postgresql/postgresql-tutorial/postgresql-hstore)
[^3]: [PostgreSQL JSON](https://neon.com/postgresql/postgresql-tutorial/postgresql-json)
[^4]: [PostgreSQL XML Data Type](https://neon.com/postgresql/postgresql-tutorial/postgresql-xml-data-type)
[^5]: [Quick Start](https://age.apache.org/getstarted/quickstart)
[^6]: [Citus](https://github.com/citusdata/citus)
[^7]: [OrioleDB: The next-generation storage engine for PostgreSQL](https://www.orioledb.com/docs)
[^8]: [pg-mem](https://github.com/oguimbal/pg-mem)
[^9]: [What does PostgreSQL to be ORDBMS mean?](https://stackoverflow.com/a/45870050)
[^10]: [Postgres Full-Text Search: A Search Engine in a Database](https://www.crunchydata.com/blog/postgres-full-text-search-a-search-engine-in-a-database)
[^11]: [Managing spatial data with the PostGIS extension](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.PostgreSQL.CommonDBATasks.PostGIS.html)
[^12]: [Introduction to PostgreSQL bytea Data Type](https://risingwave.com/blog/introduction-to-postgresql-bytea-data-type/)
[^13]: [Working with Large Objects (LOBs) in PostgreSQL](https://codedamn.com/news/sql/working-with-large-objects-lobs-in-postgresql)
[^14]: [Building Blockchain Apps on Postgres](https://www.tigerdata.com/blog/building-blockchain-apps-on-postgres)
[^15]: [Immutability in Postgres](https://stackoverflow.com/questions/55229171/immutability-in-postgres)
[^16]: [The ltree extension](https://neon.com/docs/extensions/ltree)
[^17]: [pgvector]()
[^18]: [pgvector demo source]()
[^19]: [pglite](https://pglite.dev/)