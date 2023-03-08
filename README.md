# Assingments

This is Sample template to deploy simple Web Application using Terraform also implement CICD Pipeline using gitlab

# Prerequisite

    Gitlab Account
    Teraform Binaries  

## Folder structure and usage

```
├───.terraform
│   ├───modules
│   └───providers
│       └───registry.terraform.io
│           └───hashicorp
│               └───aws
│                   └───4.56.0
│                       └───windows_amd64
|
├───ALB
├───ASG
├───custom_scripts
├───IAM
├───NATGW
├───RT
├───S3
│   └───countercode 
├───Security-Group
└───Subnets
```
# Important file for update and consideration
- main.tf --> This file is main execution file for entier terraform code
- var.tf --> This file contains all required variable for this project
- terraformstrap.tf --> This file containes S3 backend configureation for TF state file
- dynamodb.tf -> This file will create DynamoDB table for TF seesion lock 
- data.tf --> This file contains datasource information 
- .gitlab-ci.yml --> gitlab CICD piple line configuration
- S3/countercode --> This folder contains web application files (Sample Web App)

# Clone Repository

```
git clone https://gitlab.com/self6602009/Assingments.git
git branch -M main
```
 
# Configuration Gitlab Console

- Configure AWS Credentials on Gitlab
- gitlab --> Project --> Settings --> CICD --> Variable 

# Test and Deploy

- After cloning the repository 
- terraform init 
- terraform plan
- terraform apply

# Check and update the web application code
- update the index.html file under S3/countercode
- push changes to repo
- request for merge to master branch 

# Author
- Aniket Pradhane (Blazeclan Technologies)
