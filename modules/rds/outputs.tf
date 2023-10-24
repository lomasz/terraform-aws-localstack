output "cluster_id" {
  description = "Aurora cluster ID"
  value       = module.aurora.cluster_id
}

output "cluster_endpoint" {
  description = "Aurora cluster endpoint"
  value       = module.aurora.cluster_endpoint
}

output "reader_endpoint" {
  description = "Aurora cluster reader endpoint"
  value       = module.aurora.cluster_reader_endpoint
}
