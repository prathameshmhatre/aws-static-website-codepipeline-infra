// Defined at root level
variable "github_owner" {
  description = "GitHub repository owner"
  type        = string
}

// Defined at root level
variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

// Defined at root level
variable "github_branch" {
  description = "Branch to use in the GitHub repository"
  type        = string
  default     = "main" # Optional default
}

variable "github_token" {
  description = "GitHub token for authentication"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Environment for the resources"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  
}

variable "pipeline_name" {
  description = "Name of the pipeline"
  type        = string
}

// Defined at root level
variable "index_document" {
  description = "Index document for the S3 bucket"
  type        = string
  
}

// Defined at root level
variable "error_document" {
  description = "Error document for the S3 bucket"
  type        = string
  
}