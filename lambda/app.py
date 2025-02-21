import json
import boto3
import os

dynamodb = boto3.resource("dynamodb")
table_name = os.environ["DYNAMODB_TABLE"]
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    if event["httpMethod"] == "POST":
        body = json.loads(event["body"])
        item = {"id": body["id"], "data": body["data"]}
        table.put_item(Item=item)
        return {"statusCode": 200, "body": json.dumps({"message": "Item added successfully"})}

    elif event["httpMethod"] == "GET":
        items = table.scan()["Items"]
        return {"statusCode": 200, "body": json.dumps(items)}

    return {"statusCode": 400, "body": json.dumps({"message": "Unsupported method"})}