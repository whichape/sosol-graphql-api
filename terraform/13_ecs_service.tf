resource "aws_ecs_service" "sosol_service" {
  name                               = "sosol-app-service"
  cluster                            = aws_ecs_cluster.fp_ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.task_definition.arn
  desired_count                      = 2
  deployment_minimum_healthy_percent = 50
  # health_check_grace_period_seconds = 300
  # deployment_maximum_percent         = 200
  launch_type             = "FARGATE"
  scheduling_strategy     = "REPLICA"
  enable_ecs_managed_tags = true
  enable_execute_command  = true

  network_configuration {
    security_groups = [
    aws_security_group.ecs_sg.id]
    subnets = aws_subnet.public_subnets.*.id
    # subnets = aws_subnet.private_subnets.*.id
    assign_public_ip = true
    # assign_public_ip = false
  }

  load_balancer {
    container_name   = "sosol-app"
    container_port   = var.sosol_app_port
    target_group_arn = aws_alb_target_group.target_group.id
  }

  depends_on = [
    aws_alb_listener.fp_alb_listener
  ]

  # lifecycle {
  #   ignore_changes = [
  #   task_definition, desired_count]
  # }
}
