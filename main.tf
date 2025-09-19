provider "aws" {
  region = "us-east-1"
}

# Define a random string to create a unique bucket name
resource "random_string" "bucket_suffix" {
  length  = 6
  special = false
  upper   = false
}

# Create a private S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-${random_string.bucket_suffix.result}"
}

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

import {
  to = aws_s3_bucket.test
  id = "test-bucket-mahima-import"
}

resource "aws_s3_bucket" "test" {
  bucket = "test-bucket-mahima-import"
}

