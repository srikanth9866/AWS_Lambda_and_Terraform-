resource "aws_lambda_function" "app_lambda" {
  function_name = "serverless-app-function"
  s3_bucket     = aws_s3_bucket.lambda_bucket.bucket
  s3_key        = "app.zip"
  runtime       = "python3.8"
  handler       = "app.lambda_handler"
  role          = aws_iam_role.lambda_execution_role.arn

  environment {
    variables = {
      DYNAMODB_TABLE = aws_dynamodb_table.app_table.name
    }
  }

  tags = {
    Name = "Serverless Lambda Function"
  }
}