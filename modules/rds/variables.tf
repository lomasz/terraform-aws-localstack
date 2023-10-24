variable "cluster_name" {
  description = "RDS cluster name"
  type        = string
}

variable "engine_version" {
  description = "RDS engine version"
  type        = string
  default     = "11.6"
}

variable "subnets" {
  description = "Subnets for the RDS cluster"
  type        = list(string)
}

variable "security_groups" {
  description = "VPC Security Group IDs"
  type        = list(string)
}

variable "instance_type" {
  description = "Instance type for database nodes"
  type        = string
  default     = "db.r4.large"
}

variable "username" {
  description = "Username for the database"
  type        = string
}

variable "password" {
  description = "Password for the database"
  type        = string
}

variable "auto_minor_version_upgrade" {
  description = "Automatic minor version upgrades"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = bool
  default     = true
}
