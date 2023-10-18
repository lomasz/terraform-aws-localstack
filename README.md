# terraform-aws-localstack

Good evening, everybody, and welcome to the `terraform-aws-localstack` repository where everything is more confusing
than IKEA assembly instructions and the errors are treated like decorations. That's right, the infrastructure is like
socks in a dryer - it just disappears for no reason!

## Getting Started

Enter the `make` command in the terminal to see all defined targets.

### LocalStack

* Install LocalStack AWS CLI (`awslocal`)

```bash
pip install awscli-local
```

* Run LocalStack

```bash
docker-compose up
```

* Create S3 state bucket

```bash
awslocal s3api create-bucket --bucket my-terraform-state-bucket --region us-east-1
```

* Initialize Terraform:

```bash
make localstack-init
```

* Generate Terraform plan:

```bash
make localstack-plan
```

* Apply Terraform configuration:

```bash
make localstack-apply
```

### AWS

* Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html") (`aws`)

* Create S3 state bucket

```bash
aws s3api create-bucket --bucket my-terraform-state-bucket --region us-east-1
```

* Initialize Terraform:

```bash
make aws-init
```

* Generate Terraform plan:

```bash
make aws-plan
```

* Apply Terraform configuration:

```bash
make aws-apply
```



