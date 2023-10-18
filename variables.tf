variable "use_localstack" {
  description = "Whether to use LocalStack or real AWS"
  type        = bool
  default     = false
}

variable "localstack_endpoint" {
  description = "LocalStack endpoint"
  type        = string
  default     = "http://localhost:4566"
}

variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

