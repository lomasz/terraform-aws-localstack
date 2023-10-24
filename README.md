# terraform-aws-localstack

Good evening, everybody, and welcome to the `terraform-aws-localstack` repository where everything is more confusing
than IKEA assembly instructions and the errors are treated like decorations. That's right, the infrastructure is like
socks in a dryer - it just disappears for no reason!

Terraform + AWS / LocalStack + Helm

## :memo: Prerequisites
* `python` (Python 3.8 up to 3.11 supported)
* `pip` (Python package manager)
* Docker
* [Helm](https://helm.sh/docs/intro/install/)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## :rocket: Getting Started

### :house: LocalStack

* Install LocalStack AWS CLI (`awslocal`) and `tflocal`

```bash
pip install awscli-local terraform-local
```

* Run LocalStack:

  * :free: Community:

    ```bash
    docker-compose -f localstack-compose.yml up 
    ```

  * :money_with_wings: Pro:
  
    required, for example, for the EKS component. more info: [LocalStack Coverage](https://docs.localstack.cloud/references/coverage/)

    :warning: You need to provide `LOCALSTACK_API_KEY` value.

    ```bash
    export LOCALSTACK_API_KEY=<your-api-key>
    docker-compose -f localstack-pro-compose.yml up 
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

### :cloud: AWS

* Create S3 state bucket

```bash
aws s3api create-bucket --bucket my-terraform-state-bucket
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

### :package: Helm

```bash
helm install my-nginx ./helm/my-nginx-chart
```

## Connecting to EKS on LocalStack using `kubectl`
1. Update Kubeconfig for EKS Cluster:

First, you need to add the `my-eks` cluster information to your `~/.kube/config` to enable `kubectl` to know where your cluster is and how to access it.

```bash
awslocal eks update-kubeconfig --name my-eks
```

2. Configure AWS CLI for LocalStack:

Before interacting with LocalStack, configure the AWS CLI to use dummy credentials. Though LocalStack doesn't validate these credentials, it expects them to be set.

Run the configuration command:

```bash
aws configure
```

When the AWS CLI prompts you for the credentials, use the following:

```bash
AWS Access Key ID [None]: test
AWS Secret Access Key [None]: test
```

3. Now that you've configured `kubectl` to communicate with your EKS cluster on LocalStack, you can verify the connection by retrieving the cluster nodes or the available services.

```bash
kubectl get nodes
```
