resource "aws_rds_cluster_instance" "postgresql" {
  identifier         = var.instance_identifier
  cluster_identifier = aws_rds_cluster.postgresql.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.postgresql.engine
  engine_version     = aws_rds_cluster.postgresql.engine_version
}

resource "aws_rds_cluster" "postgresql" {
  cluster_identifier = var.cluster_identifier
  engine             = var.engine
  database_name      = var.db_name
  master_username    = var.master_username
  master_password    = var.master_password
}


