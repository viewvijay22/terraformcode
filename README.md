# Terraform EC2 Instance

This Terraform configuration creates a basic EC2 instance on AWS.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed (version 1.0+)
- AWS account with appropriate permissions
- AWS CLI configured with your credentials (`aws configure`)

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/viewvijay22/terraformcode.git
   cd terraformcode
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. When done, destroy the resources:
   ```bash
   terraform destroy
   ```

## Variables

You can customize the deployment by modifying the variables in `variables.tf` or by passing them via command line:

```bash
terraform apply -var="instance_type=t3.small" -var="instance_name=MyCustomInstance"
```

- `region`: AWS region (default: us-east-1)
- `ami`: AMI ID (default: Amazon Linux 2 AMI)
- `instance_type`: EC2 instance type (default: t2.micro)
- `instance_name`: Name tag for the instance (default: MyEC2Instance)

## Outputs

After applying, Terraform will output:
- `instance_id`: The ID of the created EC2 instance
- `instance_public_ip`: The public IP address
- `instance_state`: The current state of the instance

## Security Note

This is a basic configuration. In production, consider adding:
- Security groups
- Key pairs for SSH access
- VPC configuration
- IAM roles
- Monitoring and logging