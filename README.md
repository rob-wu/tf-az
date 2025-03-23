# Terraform a Web App in Azure

## Description

This repository is used to demonstrate how to create a web app with sql backend on Azure while maintaining best practices.

## Terraform
### 1. Download Terraform
- Visit the [Terraform Downloads Page](https://www.terraform.io/downloads).
- Select the appropriate version for your operating system.
- Download the binary archive (e.g., `.zip` for Windows, `.tar.gz` for Linux/macOS).

### 2. Install Terraform
#### On Windows:
1. Extract the downloaded `.zip` file.
2. Move the `terraform.exe` file to a directory included in your system's `PATH` (e.g., `C:\Program Files\Terraform`).

### 3. Clone this repo

` git clone https://github.com/rob-wu/tf-az.git`

### 4. Change directory into repostiory and initialize Terraform backend

`cd tf-az && terraform init`

### 5. Validate Terraform code for syntax errors

`terraform validate`

### 6. Run Terraform Plan to check for errors on Azure

`terraform plan`

### 7. Apply Terraform code to Azure

`terraform apply -auto-approve`

## Azure Pipeline
The build file is located in /.pipelines/build-tf.yaml. The pipeline will attempt to initialize, validate and plan Terraform code on pushes to PR and initalize, validate and apply -auto-approve if the PR is approved and merged into main. 

## Rollback
Use git log to view the previous commits

`git log`

Run git checkout with the desired commit

`git switch $commit --detach`

Run Terraform against detached branch

`terraform apply -auto-approve`
