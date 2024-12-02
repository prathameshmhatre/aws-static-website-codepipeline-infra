# Create the S3 Bucket
resource "aws_s3_bucket" "website_bucket" {
  bucket = "${var.bucket_name}-${var.environment}-${random_id.unique_id.hex}"

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }


  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "website_block" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls   = false
  block_public_policy = false
}

# Static Website Configuration
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

# Define the S3 Bucket Policy for Public Read Access
resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      }
    ]
  })
}

resource "random_id" "unique_id" {
  byte_length = 4
}