#!/bin/bash
echo "Cloning repository"
git clone https://github.com/devrimgunduz/pagila.git sample

echo "Opening repository"

export PGHOST=localhost
export PGPORT=5434
export PGDATABASE=postgres
export PGUSER=postgres
export PGPASSWORD=${SECRET_PASSWORD}

echo "Creating database"
psql -c "CREATE DATABASE pagila;" > /dev/null

export PGDATABASE=pagila

echo "Creating schema"
psql -f sample/pagila-schema.sql > /dev/null

echo "Adding data"
psql -f sample/pagila-insert-data.sql > /dev/null

echo "Cleaning up"
rm -rf sample