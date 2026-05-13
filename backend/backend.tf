# This file configures the backend for storing this backend configuration itself
# Uncomment and configure once the initial backend is created

# terraform {
#   backend "s3" {
#     bucket         = "aws-terraform-statefilevj"
#     key            = "backend/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-lock"
#     encrypt        = true
#   }
# }
