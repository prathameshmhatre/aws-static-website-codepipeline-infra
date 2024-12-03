module "s3" {
  source          = "../../modules/s3"
  bucket_name     = var.bucket_name
  index_document  = "index.html"
  error_document  = "error.html"
  environment     = var.environment
}

module "codepipeline" {
  source               = "../../modules/codepipeline"
  pipeline_name        = var.pipeline_name
  artifact_store_bucket = module.s3.bucket_name
  s3_bucket_name       = module.s3.bucket_name
  github_owner         = var.github_owner
  github_repo          = var.github_repo
  github_branch        = var.github_branch
  github_token         = var.github_token
}