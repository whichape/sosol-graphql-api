variable "logs_retention_in_days" {
  type        = number
  default     = 90
  description = "Specifies the number of days you want to retain log events"
}

resource "aws_cloudwatch_log_group" "logs" {
  # name = "sosol-app"
  name              = "/fargate/service/${var.sosol_app_name}"
  retention_in_days = var.logs_retention_in_days
  tags = {
    Environment = var.sosol_env
    Application = var.sosol_app_name
  }
}