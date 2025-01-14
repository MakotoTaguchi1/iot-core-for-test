terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # TODO: Add backend
  # backend "s3" {
  #   bucket       = "gateway-terraform-state-0104"
  #   key          = "gateway/terraform.tfstate"
  #   region       = "ap-northeast-1"
  #   encrypt      = true
  #   use_lockfile = true
  # }
}

provider "aws" {
  region = var.aws_region
  # Default 以外の ローカルAWSプロファイル を利用する場合は指定する
  # profile = "your_profile_name"
}
