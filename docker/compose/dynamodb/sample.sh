#!/bin/bash

export AWS_REGION="us-east-1"
export AWS_ACCESS_KEY_ID="local"
export AWS_SECRET_ACCESS_KEY="local"

echo "Creating table 'Music'"

aws dynamodb --endpoint "http://${DOMAIN}:8000" create-table --cli-input-json file://music-schema.json > /dev/null

echo "Adding sample data"

aws dynamodb --endpoint "http://${DOMAIN}:8000" batch-write-item --request-items file://music-data.json