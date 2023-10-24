module "aurora" {
  source = "terraform-aws-modules/rds-aurora/aws"

  name                       = var.cluster_name
  engine                     = "aurora-postgresql"
  engine_version             = var.engine_version
  subnets                    = var.subnets
  vpc_security_group_ids     = var.security_groups
  instance_class             = var.instance_type
  master_username            = var.username
  master_password            = var.password
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  apply_immediately          = var.apply_immediately
  skip_final_snapshot        = var.skip_final_snapshot
}
