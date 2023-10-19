# terraform-aws-localstack

Good evening, everybody, and welcome to the `terraform-aws-localstack` repository where everything is more confusing
than IKEA assembly instructions and the errors are treated like decorations. That's right, the infrastructure is like
socks in a dryer - it just disappears for no reason!

## Getting Started

Enter the `make` command in the terminal to see all defined targets.

### LocalStack

* Install LocalStack AWS CLI (`awslocal`) and `tflocal`

```bash
pip install awscli-local terraform-local
```

* Run LocalStack

```bash
docker-compose up
```

* Initialize Terraform:

```bash
tflocal init
```

* Generate Terraform plan:

```bash
tflocal plan
```

* Apply Terraform configuration:

```bash
tflocal apply -auto-approve
```

### AWS

* Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html") (`aws`)

* Create S3 state bucket

```bash
aws s3api create-bucket --bucket my-terraform-state-bucket --region us-east-1
```

* Initialize Terraform:

```bash
terraform init
```

* Generate Terraform plan:

```bash
terraform plan
```

* Apply Terraform configuration:

```bash
terraform apply -auto-approve
```



