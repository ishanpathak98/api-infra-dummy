resource "aws_ecs_cluster" "main" {
  name = "nodejs-api-cluster"
}

resource "aws_ecs_task_definition" "nodejs_api" {
  family                   = "nodejs-api-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "nodejs-api"
      image     = "${aws_ecr_repository.nodejs_api.repository_url}:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [{
        containerPort = 3000
        hostPort      = 3000
      }]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/nodejs-api"
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

resource "aws_ecs_service" "nodejs_api" {
  name            = "nodejs-api-service"
  cluster        = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.nodejs_api.arn
  launch_type     = "FARGATE"
  desired_count   = 2
  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.nodejs_api.arn
    container_name   = "nodejs-api"
    container_port   = 3000
  }
}
