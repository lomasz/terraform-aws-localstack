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

module "rds" {
  source = "./modules/rds"

  cluster_name               = var.db_cluster_name
  engine_version             = "11.9"
  subnets                    = module.vpc.public_subnets
  security_groups            = [module.vpc.security_group]
  instance_type              = "db.r4.large"
  username                   = var.db_username
  password                   = var.db_password
  auto_minor_version_upgrade = true
  apply_immediately          = true
  skip_final_snapshot        = true
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "eks_cluster_arn" {
  description = "EKS Cluster ARN"
  value       = module.eks.cluster_arn
}

output "rds_endpoint" {
  description = "RDS cluster endpoint"
  value       = module.rds.cluster_endpoint
}
