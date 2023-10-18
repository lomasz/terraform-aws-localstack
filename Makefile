TERRAFORM_FLAGS := -var-file=aws.tfvars
LOCALSTACK_FLAGS := -var-file=localstack.tfvars

help:
	@grep -E '^[1-9a-zA-Z_-]+:.*?## .*$$|(^#--)' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m %-43s\033[0m %s\n", $$1, $$2}' \
	| sed -e 's/\[32m #-- /[33m/'

#-- AWS:
aws-init:					## AWS: terraform init
	terraform init $(TERRAFORM_FLAGS)

aws-plan:					## AWS: terraform plan
	terraform plan $(TERRAFORM_FLAGS)

aws-apply:					## AWS: terraform apply
	terraform apply $(TERRAFORM_FLAGS)

#-- LocalStack:
localstack-init:			## LocalStack: terraform init
	terraform init \
		-backend-config="region=us-east-1" \
		-backend-config="endpoint=http://localhost:4566" \
		-backend-config="skip_credentials_validation=true" \
		-backend-config="skip_metadata_api_check=true" \
		-backend-config="force_path_style=true" \
		-backend-config="access_key=test" \
		-backend-config="secret_key=test"

localstack-plan:			## LocalStack: terraform plan
	terraform plan $(LOCALSTACK_FLAGS)

localstack-apply:			## LocalStack: terraform apply
	terraform apply $(LOCALSTACK_FLAGS) -auto-approve
