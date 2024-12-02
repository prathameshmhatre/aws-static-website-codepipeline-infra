output "bucket_name" {
  value       = aws_s3_bucket.website_bucket.bucket
  description = "Name of the S3 bucket"
}

output "website_endpoint" {
  value       = aws_s3_bucket_website_configuration.website_config.website_endpoint
  description = "URL for the static website hosted on S3"
}