# Terraform AWS Provider

## Objective
The primary objective of this repository is to demonstrate how to define and use AWS as a provider in Terraform to create EC2 instances. Additionally, it shows how to configure other providers like GitHub to manage repositories.

## Skills Learned
- Understanding of Terraform configuration and providers.
- Creating and managing AWS resources using Terraform.
- Managing GitHub repositories using Terraform.
- Initializing and configuring multiple providers in Terraform.

## Tools Used
- **Terraform**: Infrastructure as Code (IaC) tool used for building, changing, and versioning infrastructure safely and efficiently.
- **AWS**: Cloud provider for deploying and managing EC2 instances.
- **GitHub**: Platform for version control and collaboration, used for managing repositories.

## Instructions

### Setting Up AWS Provider

1. **Created a Directory and Opened in VS Code**
    ```sh
    mkdir terraform-course
    cd terraform-course
    code .
    ```

2. **Defined AWS Provider**
    - Create a new file named `main.tf`:
    ```hcl
    provider "aws" {
      region = "us-east-1"
    }
    ```

3. **Configured AWS Credentials**
    - Ensure you have AWS CLI configured with the necessary access keys:
    ```sh
    aws configure
    ```

4. **Initialized Terraform**
    - Run the following command to initialize the directory:
    ```sh
    terraform init
    ```

5. **Created an EC2 Instance**
    - Add the resource block to `main.tf`:
    ```hcl
    resource "aws_instance" "web" {
      ami           = "ami-" # 
      instance_type = "t2.micro"
    }
    ```

6. **Applied the Configuration**
    - Run the following commands to see the plan and apply it:
    ```sh
    terraform plan
    terraform apply -auto-approve
    ```

### Adding Another Provider (GitHub)

1. **Defined GitHub Provider**
    - Created a new file named `provider.tf`:
    ```hcl
    provider "github" {
      token = "github_token"
    }
    ```

2. **Initialized Terraform Again**
    - Run the initialization command to add the GitHub provider:
    ```sh
    terraform init
    ```

3. **Created a GitHub Repository**
    - Add the following resource block in `main.tf`:
    ```hcl
    resource "github_repository" "example" {
      name        = "this-awesome-github-repo"
      description = "This repo is created using Terraform"
      private     = false
    }
    ```

4. **Applied the Configuration**
    - Run the plan and apply commands:
    ```sh
    terraform plan
    terraform apply -auto-approve
    ```

By following these steps, I've demonstrated how to define and use AWS and GitHub providers in Terraform to create EC2 instances and manage GitHub repositories. This repository serves as a practical guide for managing infrastructure as code using Terraform.
