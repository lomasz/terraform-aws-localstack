locals {
  aws_access_key = var.use_localstack ? "test" : null
  aws_secret_key = var.use_localstack ? "test" : null
  endpoint       = var.use_localstack ? var.localstack_endpoint : null
}

provider "aws" {
  region = var.aws_region

  access_key = local.aws_access_key
  secret_key = local.aws_secret_key

  skip_metadata_api_check     = var.use_localstack
  skip_credentials_validation = var.use_localstack
  skip_requesting_account_id  = var.use_localstack

  endpoints {
    s3  = local.endpoint
    sts = local.endpoint
    eks = local.endpoint
  }
}

terraform {
  backend "s3" {
    bucket                      = "my-terraform-state-bucket"
    key                         = "state/terraform.tfstate"
    region                      = var.aws_region
    endpoint                    = local.endpoint
    skip_credentials_validation = var.use_localstack
    skip_metadata_api_check     = var.use_localstack
    force_path_style            = var.use_localstack
  }
}
