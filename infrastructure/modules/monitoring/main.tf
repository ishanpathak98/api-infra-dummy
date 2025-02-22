resource "aws_cloudwatch_log_group" "prometheus_logs" {
  name              = "/ecs/prometheus"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "grafana_logs" {
  name              = "/ecs/grafana"
  retention_in_days = 7
}

resource "aws_ecs_task_definition" "prometheus" {
  family                   = "prometheus"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name  = "prometheus"
      image = "prom/prometheus:latest"
      portMappings = [{ containerPort = 9090, hostPort = 9090 }]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.prometheus_logs.name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

resource "aws_ecs_task_definition" "grafana" {
  family                   = "grafana"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name  = "grafana"
      image = "grafana/grafana:latest"
      portMappings = [{ containerPort = 3000, hostPort = 3000 }]
      environment = [{ name = "GF_SECURITY_ADMIN_PASSWORD", value = var.grafana_admin_password }]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.grafana_logs.name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}
