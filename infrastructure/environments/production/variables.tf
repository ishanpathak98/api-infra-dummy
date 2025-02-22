variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID for production"
  type        = string
}

variable "subnets" {
  description = "List of subnets for production environment"
  type        = list(string)
}

variable "cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "security_groups" {
  description = "List of security groups"
  type        = list(string)
}
