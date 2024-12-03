# AWS Static Website with CodePipeline (Infrastructure)

This repository contains the **infrastructure as code** to set up a fully automated pipeline for deploying a static website to AWS using **Terraform** and **AWS CodePipeline**.

The pipeline includes the following stages:

1. **Source** - Pulls the static website code from a GitHub repository.
2. **Build** - Uses **AWS CodeBuild** to deploy the static website files to an **S3** bucket.
3. **Deploy** - Deploys the static files to the S3 bucket with **AWS S3**.

## Prerequisites

Before using this infrastructure, ensure you have the following prerequisites:

- AWS Account
- Terraform 1.x+
- AWS CLI configured with appropriate permissions
- GitHub repository containing the static website code
- CodeStar Connection configured in AWS for GitHub

## Folder Structure

```bash
├── environments/
│   ├── dev/
│   │   ├── main.tf          # Dev environment configuration
│   │   ├── variables.tf     # Variables for dev environment
│   │   └── terraform.tfvars # Environment-specific values
│   └── ...
├── modules/
│   ├── s3/
│   │   ├── main.tf          # S3 bucket resource for website hosting
│   │   ├── variables.tf     # Variables for S3 module
│   │   └── outputs.tf       # Outputs for S3 resources
│   ├── codepipeline/
│   │   ├── main.tf          # CodePipeline configuration
│   │   ├── variables.tf     # Variables for CodePipeline module
│   │   └── outputs.tf       # Outputs for CodePipeline resources
│   └── ...
├── terraform.tfvars.example  # Example terraform.tfvars for environment-specific settings
└── README.md                # Project README
```

## Setup and Configuration

1. **Clone the repository:**

   ```bash
   git clone https://github.com/prathameshmhatre/aws-static-website-codepipeline-infra.git
   cd aws-static-website-codepipeline-infra
   ```

2. **Create `terraform.tfvars` for environment-specific configurations:**

   Duplicate the `terraform.tfvars.example` and modify it to match your environment:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

   Modify the `terraform.tfvars` to specify your AWS region, GitHub details, and S3 bucket name.

3. **Initialize Terraform:**

   Initialize your Terraform workspace to download the necessary providers and set up the environment:

   ```bash
   terraform init
   ```

4. **Plan the Terraform deployment:**

   Check the execution plan for the infrastructure deployment:

   ```bash
   terraform plan -var-file="environments/dev/terraform.tfvars"
   ```

5. **Apply the Terraform configuration:**

   Apply the infrastructure changes to AWS:

   ```bash
   terraform apply -var-file="environments/dev/terraform.tfvars"
   ```

   Terraform will provision the following resources:

   - **S3 Bucket** for static website hosting
   - **CodePipeline** pipeline with Source, Build, and Deploy stages
   - **IAM Roles** for CodePipeline and CodeBuild
   - **GitHub CodeStar Connection** for integration with GitHub repository

6. **Check the deployed static website:**

   After the pipeline completes successfully, your static website will be deployed to the specified S3 bucket. You can access it via the **S3 bucket website endpoint**.

## Important Notes

- The **GitHub repository** for your static website must be connected through **AWS CodeStar** connection, which is configured as part of the CodePipeline setup.
- The **CodePipeline** deployment process will automatically trigger when changes are pushed to the GitHub repository.
- Ensure that the **S3 bucket** has the necessary permissions to allow public access to the static website files.

## Cleanup

To destroy the resources created by Terraform, run:

```bash
terraform destroy
```

This will delete all the resources created by the Terraform configuration, including the S3 bucket and CodePipeline.

## Additional Information

- The static website files are served directly from S3 and can be updated automatically with each commit to the GitHub repository.
- You can extend the pipeline to include testing, linting, or other custom actions using **CodeBuild**.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
