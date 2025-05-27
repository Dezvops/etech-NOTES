terraform {
    backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }
}


# variable "environment" {
#   description = "diff envs"
#   type = map(string)
#   default = {
#     "dev" = "us-east-1"
#     "uat" = "us-east-2"
#   }
# }

# variable "select" {
#   description = "env to deploy"
#   type = string
#   default = "uat"
# }

# provider "aws" {
#     region = var.environment[var.select]
# }


