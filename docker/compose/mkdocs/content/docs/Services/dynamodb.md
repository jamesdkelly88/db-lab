# DynamoDB

Amazon DynamoDB is a serverless, NoSQL database service that enables you to develop modern applications at any scale. With the downloadable version of Amazon DynamoDB, you can develop and test applications without accessing the DynamoDB web service. Instead, the database is self-contained on your computer.

[:fontawesome-solid-globe: Project Homepage](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html)

[:simple-docker: Container Registry](https://hub.docker.com/r/amazon/dynamodb-local)

## Requirements

AWS CLI is required on your machine to connect to DynamoDB and run the `backup` and `sample` tasks. To interact with the local database, you need to set the following environment variables:

- `AWS_ACCESS_KEY_ID` = any value, I'm using `local`
- `AWS_SECRET_ACCESS_KEY` = any value, I'm using `local`
- `AWS_REGION` = any valid AWS region, I'm using `us-east-1`

and append `--endpoint http://<hostname>:8000` to your commands.

[DynamoDB Admin](https://github.com/aaronshaf/dynamodb-admin) is provided in this lab as a web interface for DynamoDB. It comes pre-configured to connect to the local DynamoDB container, which can also be reached remotely on port `8000`.

A list of the differences between the Amazon hosted DynamoDB and this locally hosted version can be found [here](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.UsageNotes.html#DynamoDBLocal.Differences).