output "prometheus_service_url" {
  description = "Prometheus Service Endpoint"
  value       = aws_ecs_task_definition.prometheus.family
}

output "grafana_service_url" {
  description = "Grafana Service Endpoint"
  value       = aws_ecs_task_definition.grafana.family
}
