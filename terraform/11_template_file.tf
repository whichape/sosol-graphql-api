data "template_file" "task_definition_template" {
  template = file("task_definition.json.tpl")
  vars = {
    REPOSITORY_URL    = var.sosol_app_image
    POSTGRES_USERNAME = aws_db_instance.rds_instance.username
    POSTGRES_PASSWD   = aws_db_instance.rds_instance.password
    POSTGRES_ENDPOINT = aws_db_instance.rds_instance.endpoint
    POSTGRES_DATABASE = aws_db_instance.rds_instance.name
    SOSOL_APP         = var.sosol_app
    NODE_ENV          = var.sosol_env
    SOSOL_APP_HOME    = var.sosol_app_home
    SOSOL_APP_PORT    = var.sosol_app_port
    JWT_SECRET        = replace(random_string.sosol-secret-key.result, "\"", "")
    AWS_REGION        = var.region
    CLOUDWATCH_GROUP  = aws_cloudwatch_log_group.logs.name
    # DATABASE_URL=postgresql://postgres:postgres@postgres:5432/sosol_dev?schema=public
    PORT              = 7777
    AWS_ACCESS_KEY_ID = var.aws_key
    AWS_SECRET_KEY    = var.aws_secret_key
    AWS_BUCKET_NAME   = var.aws_bucket
  }
}
