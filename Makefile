.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[1-9a-zA-Z_-]+:.*?## .*$$|(^#--)' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m %-43s\033[0m %s\n", $$1, $$2}' \
	| sed -e 's/\[32m #-- /[33m/'

#-- AWS:
.PHONY: aws-init
aws-init:					## AWS: terraform init
	terraform init -var-file=aws.tfvars

.PHONY: aws-plan
aws-plan:					## AWS: terraform plan
	terraform plan -var-file=aws.tfvars

.PHONY: aws-apply
aws-apply:					## LocalStack: terraform apply
	terraform apply -var-file=aws.tfvars

#-- LocalStack:
.PHONY: localstack-init
localstack-init:			## LocalStack: terraform init
	terraform init \
		-backend-config="region=us-east-1" \
		-backend-config="endpoint=http://localhost:4566" \
		-backend-config="skip_credentials_validation=true" \
		-backend-config="skip_metadata_api_check=true" \
		-backend-config="force_path_style=true" \
		-backend-config="access_key=test" \
		-backend-config="secret_key=test"

.PHONY: localstack-plan
localstack-plan:			## LocalStack: terraform plan
	terraform plan -var-file=localstack.tfvars

.PHONY: localstack-apply
localstack-apply:			## LocalStack: terraform apply
	terraform apply -var-file=localstack.tfvars
