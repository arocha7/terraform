terraform plan -var-file=multistage_os_ptin_u14.tfvars
terraform apply -var-file=multistage_os_ptin_u14.tfvars
terraform output > hosts
