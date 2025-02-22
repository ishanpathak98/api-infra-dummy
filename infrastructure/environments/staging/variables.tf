variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "List of subnets for ECS"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups for ECS services"
  type        = list(string)
}
