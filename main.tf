module "vpc" {
  source = "./modules/vpc"

  name            = var.vpc_name
  cidr            = var.cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.eks_cluster_name
  cluster_version = "1.28"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
}

module "db" {
  source = "./modules/db"

  cluster_identifier  = var.db_cluster_name
  engine              = "aurora-postgresql"
  engine_version      = "11.9"
  db_name             = var.db_cluster_name
  master_username     = var.db_username
  master_password     = var.db_password
  instance_identifier = var.db_instance_name
  instance_class      = "db.r4.large"
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "eks_cluster_arn" {
  description = "EKS Cluster ARN"
  value       = module.eks.cluster_arn
}
