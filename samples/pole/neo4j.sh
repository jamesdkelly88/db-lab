set -e

# echo "Downloading source data"
# curl -o neo4j-pole.zip https://raw.githubusercontent.com/neo4j-graph-examples/pole/refs/heads/main/data/pole-data-importer.zip

# echo "Unpacking source data"
# unzip neo4j-pole.zip
# rm neo4j_importer_model.json

echo "Copying data into container"
for filename in *.csv; do
    docker cp $filename neo4j:/var/lib/neo4j/import/$filename
done

# echo "Importing data"
# cypher-shell -u neo4j -p P@ssw0rd -d neo4j "LOAD CSV FROM file:///crime-investigation.nodes.Area.csv AS row


LOAD CSV WITH HEADERS FROM "file:///crime-investigation.nodes.Area.csv" AS csvLine
MERGE (p:Area {id: toInteger(csvLine.`:ID`), areaCode: csvLine.areaCode})

LOAD CSV WITH HEADERS FROM "file:///crime-investigation.nodes.PostCode.csv" AS csvLine
MERGE (p:PostCode {id: toInteger(csvLine.`:ID`), code: csvLine.code})

LOAD CSV WITH HEADERS FROM "file:///crime-investigation.relationships.POSTCODE_IN_AREA.csv" AS csvLine
MATCH (area:Area {id: toInteger(csvLine.`:END_ID`)}), (postcode:PostCode {id: toInteger(csvLine.`:START_ID`)})
MERGE (postcode)-[:POSTCODE_IN_AREA]->(area)

MATCH(a:Area WHERE a.areaCode = 'M3')<-[r:POSTCODE_IN_AREA]-(p:PostCode) RETURN a,r,p

:auto LOAD CSV WITH HEADERS FROM "file:///crime-investigation.nodes.Location.csv" AS csvLine
CALL {
  WITH csvLine
  MERGE(:Location {id: toInteger(csvLine.`:ID`), latitude: toFloat(csvLine.`latitude:double`), postcode: csvLine.postcode, longitude: toFloat(csvLine.`longitude:double`), address: csvLine.address})
} IN TRANSACTIONS OF 10 ROWS

:auto LOAD CSV WITH HEADERS FROM "file:///crime-investigation.relationships.HAS_POSTCODE.csv" AS csvLine
CALL {
    WITH csvLine
    MATCH (location:Location {id: toInteger(csvLine.`:START_ID`)}), (postcode:PostCode {id: toInteger(csvLine.`:END_ID`)})
    MERGE (location)-[:HAS_POSTCODE]->(postcode)
} IN TRANSACTIONS OF 10 ROWS

MATCH(a:Area WHERE a.areaCode = 'M3')<-[r:POSTCODE_IN_AREA]-(p:PostCode)<-[h:HAS_POSTCODE]-(l:Location) RETURN a,r,p,h,l

# LOAD CSV FROM 'https://data.neo4j.com/bands/artists.csv'
# AS row
# MERGE (:Artist {name: row[1], year: toInteger(row[2])})
# FINISH

# :auto LOAD CSV WITH HEADERS FROM 'file:///roles.csv' AS csvLine
# CALL {
#  WITH csvLine
#  MATCH (person:Person {id: toInteger(csvLine.personId)}), (movie:Movie {id: toInteger(csvLine.movieId)})
# CREATE (person)-[:ACTED_IN {role: csvLine.role}]->(movie)
# } IN TRANSACTIONS OF 2 ROWS

# echo "Deleting source files"
# # rm neo4j-pole.zip
# for filename in *.csv; do
#     docker exec neo4j rm /var/lib/neo4j/import/$filename
#     rm $filename
# done


(area:Area {id: toInteger(csvLine.`:END_ID`)})