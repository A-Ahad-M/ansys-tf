provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.7.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.7.1"
    }
  }
}
