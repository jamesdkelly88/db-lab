---
tags:
  - document
---
# DynamoDB

[:fontawesome-solid-globe: Project Homepage](https://www.postgresql.org/)

[:simple-git: Repository](https://git.postgresql.org/gitweb/?p=postgresql.git)

[:simple-docker: Container Registry](https://hub.docker.com/_/postgres)

Amazon DynamoDB is a serverless, NoSQL database service that enables you to develop modern applications at any scale. With the downloadable version of Amazon DynamoDB, you can develop and test applications without accessing the DynamoDB web service. Instead, the database is self-contained on your computer.

To interact with the local database, you need to set the following environment variables:

- `AWS_ACCESS_KEY_ID` = any value, I'm using `local`

- `AWS_SECRET_ACCESS_KEY` = any value, I'm using `local`

- `AWS_REGION` = any valid AWS region, I'm using `us-east-1`

and append `--endpoint http://<hostname>:8000` to your commands.

A list of the differences between the Amazon hosted DynamoDB and this locally hosted version can be found [here](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.UsageNotes.html#DynamoDBLocal.Differences).

## GUI

- [DynamoDB Admin](../dynamodb-admin)

## Images
| Image | Tag |
| --- | --- |
| amazon/dynamodb-local | 2.5.4 |

## Ports
- 8000


