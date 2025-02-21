resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "serverless-app-lambda-bucket291299"

  tags = {
    Name = "Lambda Deployment Bucket"
  }
}
