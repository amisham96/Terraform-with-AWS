terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "mybucket-amit07"
    key    = "statefile/mytfstate"
    region = "us-east-1"
  }
}