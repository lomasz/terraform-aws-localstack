terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "state/terraform.tfstate"
  }
}

terraform {
  required_version = "= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
