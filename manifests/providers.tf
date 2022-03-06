terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }
}

# AWS Provider Configuration
provider "aws" {
  region = var.aws_region
}