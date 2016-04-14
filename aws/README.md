## Variants
1. cluster - Starts master and slave nodes
2. combined - starts a single node having both roles

## Prerequisities
Fill out .tfvars file with private key info

## Running a variant

    export AWS_ACCESS_KEY_ID=xxx
    export AWS_SECRET_ACCESS_KEY=yyy
    terraform plan
    terraform apply

## Debugging aws connectivity

    TF_LOG=DEBUG terraform apply

## Issues
Terraform yields an error trying to delete the security group, claiming it's in use.  
You have to manually delete it from EC2 after running `terraform destroy`.

