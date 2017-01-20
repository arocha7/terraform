terraform plan -var-file=multistage_os_ptin_ce7.tfvars
terraform apply -var-file=multistage_os_ptin_ce7.tfvars
terraform output > hosts
