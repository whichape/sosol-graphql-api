data "template_file" "task_definition_template" {
  template = file("task_definition.json.tpl")
  vars = {
    REPOSITORY_URL    = var.sosol_app_image
    POSTGRES_USERNAME = aws_db_instance.rds_instance.username
    POSTGRES_PASSWD   = aws_db_instance.rds_instance.password
    POSTGRES_ENDPOINT = aws_db_instance.rds_instance.endpoint
    POSTGRES_DATABASE = aws_db_instance.rds_instance.name
    SOSOL_APP         = var.sosol_app
    SOSOL_ENV         = var.sosol_env
    SOSOL_APP_HOME    = var.sosol_app_home
    SOSOL_APP_PORT    = var.sosol_app_port
    APP_SECRET_KEY    = replace(random_string.sosol-secret-key.result, "\"", "")
    REGION            = var.region
    CLOUDWATCH_GROUP  = aws_cloudwatch_log_group.logs.name

  }
}