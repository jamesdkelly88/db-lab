import boto3
import os

host = os.environ['DOMAIN']

ddb = boto3.client(
        'dynamodb', 
        aws_access_key_id="local",
        aws_secret_access_key="local",
        endpoint_url='http://localhost:8000', 
        region_name='us-east-1'
)
tables = ddb.list_tables()['TableNames']
print(tables)