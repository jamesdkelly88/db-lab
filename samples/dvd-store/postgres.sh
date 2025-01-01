set -e

case $1 in
    12 | 13 | 14 | 15 | 16 | 17 )
        PG_HOSTNAME=postgres$1;;    
    ha )
        PG_HOSTNAME=pg_proxy;;
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
# create docker volume

echo "Cloning repository: $REPO_URL"
# alpine/git clone repo to volume

echo "Creating database: $DB_NAME on target: $PG_HOSTNAME" 
# alpine/psql psql -c "CREATE DATABASE pagila;" (no volume mount)

echo "Applying database schema"
# alpine/psql psql -f sample/pagila-schema.sql 

echo "Loading data"
# alpine/psql psql -f sample/pagila-insert-data.sql

echo "Cleaning up"
# delete docker volume
