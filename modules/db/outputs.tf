output "cluster_endpoint" {
  value = aws_rds_cluster.postgresql.endpoint
}

output "instance_endpoint" {
  value = aws_rds_cluster_instance.postgresql.endpoint
}
