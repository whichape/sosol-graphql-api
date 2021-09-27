output "postgres_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

output "postgres_database_url" {
  vale = "postgresql://${aws_db_instance.rds_instance.username}:${aws_db_instance.rds_instance.password}@${aws_db_instance.rds_instance.endpoint}:${aws_db_instance.rds_instance.port}/${aws_db_instance.rds_instance.name}?schema=public"
}

output "alb_dns_name" {
  value = aws_alb.alb.dns_name
}

output "jwt_secret" {
  value = replace(random_string.sosol-secret-key.result, "\"", "")
}
