set -e

source ../../db-lab.env

case $1 in
    12 | 13 | 14 | 15 | 16 | 17 )
        PG_HOSTNAME=postgres$1;;    
    ha )
        PG_HOSTNAME=pg-proxy;;
    *)
        echo "usage: ./postgres.sh <version>";
        echo "examples:";
        echo "- ./postgres.sh 16        deploy sample database to version 16";
        echo "- ./postgres.sh ha        deploy sample database to high-availability deployment";
        exit 0;;
esac

DB_NAME=pagila
REPO_URL=https://github.com/devrimgunduz/pagila.git
VOLUME_NAME="${DB_NAME}_${RANDOM}"

echo "Creating docker volume: $VOLUME_NAME"
docker volume create $VOLUME_NAME

echo "Creating database: $DB_NAME on target: $PG_HOSTNAME" 
docker run \
--attach stdout \
--attach stderr \
--env PGHOST=$PG_HOSTNAME \
--env PGPORT=5432 \
--env PGDATABASE=postgres \
--env PGUSER=postgres \
--env PGPASSWORD=$SECRET_PASSWORD \
--name pagila-create \
--network postgres \
--rm \
alpine/psql \
-c "CREATE DATABASE $DB_NAME;"

echo "Cloning repository: $REPO_URL"
docker run \
--attach stdout \
--attach stderr \
--volume $VOLUME_NAME:/data \
--name pagila-clone \
--network postgres \
--rm \
--workdir /data \
alpine/git \
clone $REPO_URL .

echo "Applying database schema"
docker run \
--attach stdout \
--attach stderr \
--env PGHOST=$PG_HOSTNAME \
--env PGPORT=5432 \
--env PGDATABASE=$DB_NAME \
--env PGUSER=postgres \
--env PGPASSWORD=$SECRET_PASSWORD \
--volume $VOLUME_NAME:/data \
--name pagila-schema \
--network postgres \
--rm \
--workdir /data \
alpine/psql \
-f pagila-schema.sql

echo "Loading data"
docker run \
--attach stdout \
--attach stderr \
--env PGHOST=$PG_HOSTNAME \
--env PGPORT=5432 \
--env PGDATABASE=$DB_NAME \
--env PGUSER=postgres \
--env PGPASSWORD=$SECRET_PASSWORD \
--volume $VOLUME_NAME:/data \
--name pagila-data \
--network postgres \
--rm \
--workdir /data \
alpine/psql \
-q -1 -f pagila-insert-data.sql

echo "Cleaning up volume $VOLUME_NAME"
# delete docker volume
docker volume rm $VOLUME_NAME
