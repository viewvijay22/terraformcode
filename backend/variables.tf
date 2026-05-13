variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket for storing Terraform state"
  type        = string
  default     = "aws-terraform-statefilevj"

  validation {
    condition     = length(var.state_bucket_name) >= 3 && length(var.state_bucket_name) <= 63
    error_message = "S3 bucket name must be between 3 and 63 characters."
  }
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-state-lock"

  validation {
    condition     = can(regex("^[a-zA-Z0-9._-]+$", var.dynamodb_table_name))
    error_message = "DynamoDB table name can only contain alphanumeric characters, dots, underscores, and hyphens."
  }
}

variable "environment" {
  description = "Environment name for tagging resources"
  type        = string
  default     = "production"
}
