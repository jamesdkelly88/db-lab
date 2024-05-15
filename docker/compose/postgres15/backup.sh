#!/bin/bash

export AWS_ACCESS_KEY_ID=${SECRET_USER}
export AWS_SECRET_ACCESS_KEY=${SECRET_PASSWORD}
export AWS_DEFAULT_REGION=us-east-1
export AWS_ENDPOINT_URL_S3=http://minio.${DOMAIN}:9000
export S3_BUCKET=backups

if aws s3api head-bucket --bucket "$S3_BUCKET" 2>/dev/null; then
    echo "bucket '$S3_BUCKET' exists"
else
    echo "bucket '$S3_BUCKET' doesn't exist, creating"
    aws s3api create-bucket --bucket "$S3_BUCKET" > /dev/null
fi

export PGHOST=localhost
export PGPORT=5433
export PGDATABASE=postgres
export PGUSER=postgres
export PGPASSWORD=${SECRET_PASSWORD}
export VERSION=15

DBS=$(psql -t -c "select datname from pg_database where datistemplate = false;")
DATE=$(date '+%Y-%m-%d.%H%M%S')

for DB in $DBS; do
  FILENAME="${DB}_${DATE}.dump"
  echo "Backing up '$DB' to '$FILENAME'"
  pg_dump -Fc $DB > $FILENAME
  echo "Uploading '$DB' backup to 's3://backups/postgres/$VERSION/$DB/$FILENAME'"
  aws s3 cp $FILENAME "s3://backups/postgres/$VERSION/$DB/$FILENAME" > /dev/null
  echo "Deleting '$FILENAME'"
  rm $FILENAME
done 