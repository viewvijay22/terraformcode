# Example Backend Configuration for Other Terraform Modules
# 
# This file shows how to configure other Terraform modules to use the S3 backend
# with DynamoDB state locking created in the backend/ directory.
#
# To use this configuration in any Terraform module, add it to your terraform block
# and update the "key" value for each module.

terraform {
  backend "s3" {
    bucket         = "aws-terraform-statefilevj"
    key            = "mymodule/terraform.tfstate"  # Change this for each module
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

# Example: For your EC2 module, it would be:
# key = "ec2/terraform.tfstate"
#
# This ensures each module has its own isolated state file while sharing
# the same S3 bucket and DynamoDB lock table for state management.
