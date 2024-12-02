output "dev_website_url" {
  value       = module.s3.website_endpoint
  description = "URL for the static website hosted on S3 in the dev environment"
}