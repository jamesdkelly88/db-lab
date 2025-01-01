set -e

echo "Creating table 'Music'"

docker run \
--attach stdout \
--attach stderr \
--env AWS_REGION=us-east-1 \
--env AWS_ACCESS_KEY_ID=local \
--env AWS_SECRET_ACCESS_KEY=local \
--mount type=bind,src=./data,dst=/data \
--name dynamodb-music-sample \
--network dynamodb \
--rm \
--workdir /data \
amazon/aws-cli \
dynamodb --endpoint "http://dynamodb:8000" create-table --cli-input-json file://music-schema.json > /dev/null

echo "Adding sample data"

docker run \
--attach stdout \
--attach stderr \
--env AWS_REGION=us-east-1 \
--env AWS_ACCESS_KEY_ID=local \
--env AWS_SECRET_ACCESS_KEY=local \
--mount type=bind,src=./data,dst=/data \
--name dynamodb-music-sample \
--network dynamodb \
--rm \
--workdir /data \
amazon/aws-cli \
dynamodb --endpoint "http://dynamodb:8000" batch-write-item --request-items file://music-data.json