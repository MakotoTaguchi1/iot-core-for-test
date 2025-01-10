variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "test"
}

# ローカルのクレデンシャルからAWS情報を取得
data "aws_caller_identity" "current" {}
