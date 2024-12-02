provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# Include environment files dynamically
module "dev" {
  source = "./environments/dev"
}