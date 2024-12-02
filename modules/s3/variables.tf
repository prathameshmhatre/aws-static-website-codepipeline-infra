variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "index_document" {
  description = "Default index document for the website"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Default error document for the website"
  type        = string
  default     = "error.html"
}

variable "environment" {
  description = "Environment for tagging purposes (e.g., dev, staging, prod)"
  type        = string
}