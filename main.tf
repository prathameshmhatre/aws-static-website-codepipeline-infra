provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# Include environment files dynamically
module "dev" {
  source = "./environments/dev"
  environment     = var.environment
  bucket_name     = var.bucket_name
  pipeline_name   = var.pipeline_name
  github_owner    = var.github_owner
  github_repo     = var.github_repo
  github_branch   = var.github_branch
  github_token    = var.github_token
  index_document  = var.index_document
  error_document  = var.error_document
}

