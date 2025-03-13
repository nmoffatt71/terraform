# subscription

#application
export TF_VAR_application_name="observability"
export TF_VAR_environment_name="prod"
# backend


# run terraform
terraform init \
    -backend-config="resource_group_name=rg-neilswebsite-prod" \
    -backend-config="storage_account_name=stnfrvsd1hsz" \
    -backend-config="container_name=sc-neilswebsite-prod" \
    -backend-config="key=observability-prod" 

terraform $*

rm -rf .terraform
