# stop neo4j
echo "Stopping Neo4j"
docker stop neo4j

# create backup volume
echo "Creating backup volume"
docker volume create neo4j_backup

# set date
DATE=$(date '+%Y-%m-%d.%H%M%S')

# run neo4j-admin with data and backup attached to backup database
echo "Backing up database"
docker run \
--rm \
--attach stdout \
--attach stderr \
--volume neo4j_data:/data \
--volume neo4j_backup:/backups \
neo4j/neo4j-admin:community \
neo4j-admin database dump neo4j --to-path=/backups

# run aws image with backup attached to upload to minio
echo "Uploading to minio"
docker run \
--rm \
--attach stdout \
--attach stderr \
--network backup \
--volume neo4j_backup:/backups \
--env AWS_ENDPOINT_URL_S3=http://minio:9000 \
--env AWS_REGION=us-east-1 \
--env AWS_ACCESS_KEY_ID=${SECRET_USER} \
--env AWS_SECRET_ACCESS_KEY=${SECRET_PASSWORD} \
amazon/aws-cli:latest \
s3 cp /backups/neo4j.dump s3://backups/neo4j/neo4j/neo4j_${DATE}.dump

# delete backup volume
echo "Deleting backup volume"
docker volume rm neo4j_backup

# start neo4j
echo "Starting Neo4j"
docker start neo4j



