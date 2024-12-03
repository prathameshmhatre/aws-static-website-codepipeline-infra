variable "pipeline_name" {
  description = "Name of the pipeline"
  type        = string
}

variable "artifact_store_bucket" {
  description = "Name of the artifact S3 bucket"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for deployment"
  type        = string
}

variable "github_owner" {
  description = "GitHub username or organization"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "github_branch" {
  description = "Branch to track in the GitHub repository"
  type        = string
}

variable "github_token" {
  description = "Personal access token for GitHub integration"
  type        = string
}
