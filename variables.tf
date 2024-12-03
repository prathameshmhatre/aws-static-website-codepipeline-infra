variable "aws_region" {
  description = "AWS region for the resources"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile for the resources"
  type        = string
  default     = "default"
}

variable "github_owner" {
  description = "GitHub repository owner"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

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

variable "index_document" {
  description = "Index document for the S3 bucket"
  type        = string
  
}

variable "error_document" {
  description = "Error document for the S3 bucket"
  type        = string
  
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