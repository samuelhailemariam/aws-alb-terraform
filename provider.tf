terraform {
  # required_version = ">=0.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    region = "us-west-2"
    key    = "terraformalbstatefile"
    bucket = "walabs-shewit-terraformstate"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}