module "s3" {
  source          = "../../modules/s3"
  bucket_name     = "dev-static-website"
  index_document  = "index.html"
  error_document  = "error.html"
  environment     = "dev"
}