# # get list of tables

# # scan tables to json 
# aws dynamodb --endpoint-url http://localhost:8000 --region eu-west-1 scan --table-name another

# {
#     "Items": [
#         {
#             "two": {
#                 "S": "b"
#             },
#             "one": {
#                 "S": "a"
#             }
#         }
#     ],
#     "Count": 1,
#     "ScannedCount": 1,
#     "ConsumedCapacity": null
# }

# # upload files to s3 and delete