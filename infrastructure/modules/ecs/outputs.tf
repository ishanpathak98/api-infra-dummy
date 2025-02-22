output "ecs_cluster_id" {
  description = "ECS Cluster ID"
  value       = aws_ecs_cluster.main.id
}

output "ecs_task_definition_arn" {
  description = "ECS Task Definition ARN"
  value       = aws_ecs_task_definition.nodejs_api.arn
}

output "ecs_service_id" {
  description = "ECS Service ID"
  value       = aws_ecs_service.nodejs_api.id
}
