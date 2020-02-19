import json

def squaredNum(event, context):
    yourNum = event["queryStringParameters"]["number"]
    squareNum = float(yourNum) ** 2

    body = {
        "message": "Here is the squared value of the number you inserted",
        "yourNumber": squareNum
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }
    
    return response



def hello(event, context):
    body = {
        "message": "SUP MASTERMND ACADEMY!!! Your function executed successfully!",
        "input": event
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response


def shoppingList(event, context):
    ourItem = event["queryStringParameters"]["item"]
    
    body = {
        "message": "Here is the item that you need to buy next time you go to the store.",
        "item": ourItem
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }
    
    return response
