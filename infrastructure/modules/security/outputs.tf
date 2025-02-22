output "waf_acl_id" {
  description = "ID of the WAF ACL"
  value       = aws_waf_web_acl.api_waf.id
}

output "ecs_task_execution_role_arn" {
  description = "IAM Role ARN for ECS task execution"
  value       = aws_iam_role.ecs_task_execution_role.arn
}
