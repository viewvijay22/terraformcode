# Terraform S3 Backend with DynamoDB State Locking

This directory contains Terraform configuration to provision an S3 bucket and DynamoDB table for managing Terraform state files with state locking.

## Resources Created

- **S3 Bucket**: Stores Terraform state files with versioning and encryption enabled
- **DynamoDB Table**: Provides state locking to prevent concurrent state modifications

## Features

✅ S3 bucket versioning for state file history  
✅ Server-side encryption (AES256) for state files  
✅ Public access blocked for security  
✅ DynamoDB table for state locking  
✅ PAY_PER_REQUEST billing for DynamoDB (no management required)  
✅ Comprehensive tagging for resource tracking  

## Prerequisites

- AWS account with appropriate permissions
- Terraform CLI installed (version 1.0+)
- AWS credentials configured

## Deployment

### Step 1: Initialize Terraform
```bash
cd backend
terraform init
```

### Step 2: Plan the Deployment
```bash
terraform plan -out=tfplan
```

### Step 3: Apply the Configuration
```bash
terraform apply tfplan
```

### Step 4: Copy Backend Configuration
After applying, copy the backend configuration output to use in other Terraform modules:

```hcl
terraform {
  backend "s3" {
    bucket         = "aws-terraform-statefilevj"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
```

## Usage in Other Modules

Once the backend is created, you can configure other Terraform modules to use this backend. Add the following to your `main.tf`:

```hcl
terraform {
  backend "s3" {
    bucket         = "aws-terraform-statefilevj"
    key            = "mymodule/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
```

## Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region for resources | `us-east-1` |
| `state_bucket_name` | S3 bucket name for state files | `aws-terraform-statefilevj` |
| `dynamodb_table_name` | DynamoDB table name for locking | `terraform-state-lock` |
| `environment` | Environment name for tagging | `production` |

## Outputs

- `s3_bucket_id`: The S3 bucket ID
- `s3_bucket_arn`: The S3 bucket ARN
- `dynamodb_table_name`: The DynamoDB table name
- `backend_config`: Complete backend configuration for other modules

## Destroying Resources

To destroy the backend infrastructure:

```bash
terraform destroy
```

**WARNING**: This will delete the S3 bucket and DynamoDB table. Ensure you have backups of your state files before destroying.

## Security Best Practices

1. Enable MFA delete on the S3 bucket for additional protection
2. Use IAM policies to restrict access to the S3 bucket and DynamoDB table
3. Enable CloudTrail for auditing
4. Consider using KMS encryption instead of S3-managed encryption
5. Regularly backup state files

## Troubleshooting

### S3 Bucket Name Already Exists
S3 bucket names are globally unique. If you get a "bucket already exists" error:
- Modify the `state_bucket_name` variable in `terraform.tfvars`
- Ensure the new name is unique across AWS

### DynamoDB Capacity Issues
The table uses PAY_PER_REQUEST billing mode, so you don't need to worry about capacity.

### State Lock Conflicts
If you encounter lock timeout errors:
- Check DynamoDB table status
- Verify IAM permissions for DynamoDB access
- Check for zombie lock entries in DynamoDB
