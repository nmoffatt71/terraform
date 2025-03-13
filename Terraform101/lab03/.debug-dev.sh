# subscription

#application
export TF_VAR_application_name="observability"
export TF_VAR_environment_name="dev"
# backend


# run terraform
terraform init \
    -backend-config="resource_group_name=rg-neilswebsite-dev" \
    -backend-config="storage_account_name=stf32n5ujq16" \
    -backend-config="container_name=sc-neilswebsite-dev" \
    -backend-config="key=observability-dev" 

terraform $*

rm -rf .terraform
