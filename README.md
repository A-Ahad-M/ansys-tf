# ansys-tf
### Deploying the Terraform

Follow these steps to deploy the infrastructure:

1. Go inside the required folder.
2. Change the backend of the state file in the `backend.tf`
3. Check the `terraform.tfvars` file and modify the variables if necessary.
4. Once you are ready to deploy, run the following commands inside the specific folder to deploy the corresponding service:


        terraform init                  # Prepare your working directory
        
        terraform validate              # Check configuration validity
        
        terraform plan                  # Show changes required by the configuration
    
        terraform apply                 # Create or update infrastructure


5. If you want to destroy any resources created with the previous commands, run the following command:

        terraform destroy               # Destroy previously-created infrastructure
