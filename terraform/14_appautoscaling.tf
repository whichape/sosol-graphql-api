resource "aws_appautoscaling_target" "sosol_target" {
  max_capacity       = 200
  min_capacity       = 2
  resource_id        = "service/${aws_ecs_cluster.fp_ecs_cluster.name}/${aws_ecs_service.sosol_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "sosol_memory" {
  name               = "sosol-memory"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.sosol_target.resource_id
  scalable_dimension = aws_appautoscaling_target.sosol_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.sosol_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value = 60
  }
}

resource "aws_appautoscaling_policy" "sosol_cpu" {
  name               = "sosol-cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.sosol_target.resource_id
  scalable_dimension = aws_appautoscaling_target.sosol_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.sosol_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 40
  }
}
