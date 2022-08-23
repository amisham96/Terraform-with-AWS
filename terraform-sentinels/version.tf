terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "remote" {
    organization = "my-organization07"
    workspaces {
      name = "my-new-workspace"
    }
  }
}