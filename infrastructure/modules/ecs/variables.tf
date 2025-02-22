variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "subnets" {
  description = "List of subnets for ECS"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups for ECS services"
  type        = list(string)
}
