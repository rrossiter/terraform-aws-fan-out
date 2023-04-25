terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  region  = "sa-east-1"
  profile = "default"

  # s3_use_path_style           = true
  # skip_credentials_validation = true
  # skip_metadata_api_check     = true
  # skip_requesting_account_id  = true

  default_tags {
    tags = merge(var.custom_tags, var.default_tags)
  }

  # endpoints {
  #   s3       = "http://s3.localhost.localstack.cloud:4566"
  #   lambda   = "http://localhost:4566"
  #   dynamodb = "http://localhost:4566"
  #   ssm      = "http://localhost:4566"
  #   sqs      = "http://localhost:4566"
  #   iam      = "http://localhost:4566"
  #   sns = "http://localhost:4566"
  # }
}
