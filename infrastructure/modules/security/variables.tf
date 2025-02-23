variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "rate_limit" {
  description = "API request rate limit"
  type        = number
  default     = 1000
}
