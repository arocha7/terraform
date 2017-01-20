terraform plan -var-file=multistage_os_ptin_u16.tfvars
terraform apply -var-file=multistage_os_ptin_u16.tfvars
terraform output > hosts
