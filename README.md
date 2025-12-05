# Infrastructure as Code (IaC) Templates

This repository contains a collection of Infrastructure as Code (IaC) templates and configurations for deploying AWS resources. It serves as a reference and starting point for managing infrastructure using both **AWS CloudFormation** and **Terraform**.

## Prerequisites

Before using the templates in this repository, ensure you have the following tools installed and configured:

*   **AWS CLI**: [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and configure it with your credentials (`aws configure`).
*   **Terraform**: [Install Terraform](https://developer.hashicorp.com/terraform/downloads) (required for the `TERRAFORM` directory).

## Project Structure

The project is organized into two main directories based on the IaC tool used:

```
.
├── CloudFormation/      # AWS CloudFormation templates
│   ├── infra.yaml       # Template for VPC, EC2, and S3
│   └── vpc.yaml         # Template for a standalone VPC with subnets
└── TERRAFORM/           # Terraform configurations
    ├── infra/           # Module for VPC, EC2, S3, and Security Groups
    └── vpc/             # Module for a basic VPC and Subnets
```

---

## CloudFormation

The `CloudFormation` directory contains YAML templates that can be deployed using the AWS Console or AWS CLI.

### 1. VPC Template (`vpc.yaml`)
Creates a Virtual Private Cloud (VPC) with two subnets and an Internet Gateway.

**Resources Created:**
*   VPC
*   Two Subnets
*   Internet Gateway & Attachment

**Deploy via CLI:**
```bash
aws cloudformation create-stack --stack-name my-vpc-stack --template-body file://vpc.yaml --parameters ParameterKey=VpcCIDR,ParameterValue=10.0.0.0/16
```
*Note: cd `\` to navigate to the CloudFormation directory, then run the command.*

### 2. Infrastructure Template (`infra.yaml`)
A more comprehensive template that provisions networking, compute, and storage resources.

**Resources Created:**
*   VPC & Public Subnet
*   Internet Gateway & Route Table
*   Security Group (Allowing SSH, HTTP, HTTPS)
*   EC2 Instance (t3.micro by default)
*   S3 Bucket

**Deploy via CLI:**
```bash
aws cloudformation create-stack --stack-name my-infra-stack --template-body file://infra.yaml --parameters ParameterKey=KeyName,ParameterValue=YOUR_KEY_PAIR_NAME

```
*Note: Replace `YOUR_KEY_PAIR_NAME` with an existing EC2 Key Pair name in your AWS account. cd `\` to navigate to the CloudFormation directory, then run the command.*

---

## Terraform

The `TERRAFORM` directory contains Terraform modules. Each subdirectory (`infra`, `vpc`) is a self-contained Terraform configuration.

### 1. VPC Module (`TERRAFORM/vpc`)
Provisions a VPC and associated subnets.

**Usage:**
1.  Navigate to the directory:
    ```bash
    cd TERRAFORM/vpc
    ```
2.  Initialize Terraform:
    ```bash
    terraform init
    ```
3.  Review the plan:
    ```bash
    terraform plan
    ```
4.  Apply the configuration:
    ```bash
    terraform apply
    ```

### 2. Infrastructure Module (`TERRAFORM/infra`)
Provisions a complete infrastructure stack including VPC, EC2, and S3.

**Resources Created:**
*   VPC, Subnet, Internet Gateway, Route Table
*   Security Group
*   EC2 Instance
*   S3 Bucket (with a random suffix)

**Usage:**
1.  Navigate to the directory:
    ```bash
    cd TERRAFORM/infra
    ```
2.  Initialize Terraform:
    ```bash
    terraform init
    ```
3.  Review the plan:
    ```bash
    terraform plan
    ```
4.  Apply the configuration:
    ```bash
    terraform apply
    ```
    *You may be prompted to enter variable values if they are not defined in `terraform.tfvars`.*

## Clean Up

To avoid incurring charges, remember to delete the resources when you are done.

*   **CloudFormation**:
    ```bash
    aws cloudformation delete-stack --stack-name my-vpc-stack
    aws cloudformation delete-stack --stack-name my-infra-stack
    ```
*   **Terraform**:
    Run `terraform destroy` in the respective directories.
