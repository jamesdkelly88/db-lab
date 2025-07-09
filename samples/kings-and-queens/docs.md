# Kings and Queens database

Sample database containing Kings and Queens of England, 1066 to the present day.

## Schema

## Sample Queries

### Neo4j

```sql
-- INSERT NODE
CREATE (k:KING {
  name: "Henry VIII",
  regnal_name: "Henry",
  number: 8,
  born: date('1491-06-28'),
  ascended: date('1509-04-22'),
  crowned: date('1509-06-24'),
  died: date('1547-01-28')
})
RETURN k
-- SELECT ALL NODES
MATCH (n)
RETURN n
-- SELECT ALL NODES BY LABEL
MATCH(k:KING)
RETURN k.name, k.born, k.died
-- SELECT NODE BY PROPERTY
MATCH (n:KING {number: 8})
RETURN n
-- UPDATE NODE
MATCH (n {name: 'Henry VIII'})
SET n.family = 'Tudor'
RETURN n.name, n.family
-- DELETE NODE
MATCH (n {name: 'Henry VIII'})
DELETE n
-- DELETE NODE WITH RELATIONSHIPS
MATCH (n {name: 'Henry VIII'})
DETACH DELETE n
-- SELECT NODES AND ADD VERTEX
MATCH (h7 {name: 'Henry VII'})
MATCH (h8 {name: 'Henry VIII'})
CREATE (h8)-[:SUCCEEDED]->(h7)
CREATE (h7)-[:SUCCEEDED_BY]->(h8)
-- SELECT RELATIONSHIP
MATCH (h8 {name: 'Henry VIII'})-[r]->(n)
RETURN type(r),n.name

-- MONARCHS SUCCEEDED BY THEIR KILLERS
MATCH(m:KING|QUEEN)-[:KILLED_BY]->(k:KING|QUEEN)<-[:SUCCEEDED_BY]-(m)
WHERE k.ascended is not null
RETURN m.name as Monarch, m.died as Date, k.name as Killer

-- ROYALS WHO MARRIED THEIR COUSINS

-- ROYALS ALIVE IN 1649

-- MONARCH IN 1776
```

### PostgreSQL (Apache AGE extension)

```sql
CREATE EXTENSION age;
LOAD 'age';
ALTER DATABASE <db> SET search_path TO ag_catalog, "$user", public;
SELECT create_graph('kings_and_queens'); -- VERIFY: SELECT * FROM ag_graph;
-- INSERT NODE
SELECT * FROM cypher('kings_and_queens', $$
CREATE (k:KING {
  name: "Henry VIII",
  regnal_name: "Henry",
  number: 8,
  born: '1491-06-28',
  ascended: '1509-04-22',
  crowned: '1509-06-24',
  died: '1547-01-28'
})
RETURN k
$$) as (k agtype)
-- SELECT ALL NODES
SELECT * FROM cypher('kings_and_queens', $$
MATCH (n)
RETURN n
$$) as (n agtype)
-- SELECT ALL NODES BY LABEL
SELECT name, born::date, died::date FROM cypher('kings_and_queens', $$
MATCH(k:KING)
RETURN k.name, k.born, k.died
$$) as (name text, born text, died text)
-- SELECT NODE BY PROPERTY
SELECT * FROM cypher('kings_and_queens', $$
MATCH (n:KING {number: 8})
RETURN n
$$) as (n agtype)
-- UPDATE NODE
SELECT * FROM cypher('kings_and_queens', $$
MATCH (n {name: 'Henry VIII'})
SET n.family = 'Tudor'
RETURN n.name, n.family
$$) as (name text, family text)
-- DELETE NODE
SELECT * FROM cypher('kings_and_queens', $$
MATCH (n {name: 'Henry VIII'})
DELETE n
$$) as (n agtype)
-- SELECT NODES AND ADD VERTEX

SELECT * FROM cypher('kings_and_queens', $$
CREATE (k:KING {
  name: "Henry VII",
  regnal_name: "Henry",
  number: 7,
  born: '1547-01-28',
  ascended: '1485-08-22',
  crowned: '1485-10-30',
  died: '1509-04-21',
  family: 'Tudor'
})
RETURN k
$$) as (k agtype)

SELECT * FROM cypher('kings_and_queens', $$
MATCH (h7 {name: 'Henry VII'})
MATCH (h8 {name: 'Henry VIII'})
CREATE (h8)-[:SUCCEEDED]->(h7)
CREATE (h7)-[:SUCCEEDED_BY]->(h8)
$$) as (k agtype)


-- SELECT RELATIONSHIP
SELECT * FROM cypher('kings_and_queens', $$
MATCH (h8 {name: 'Henry VIII'})-[r]->(n)
RETURN label(r),n.name
$$) as (relationship text, name text)

```