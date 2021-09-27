output "postgres_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

output "alb_dns_name" {
  value = aws_alb.alb.dns_name
}

output "jwt_secret" {
  value = replace(random_string.sosol-secret-key.result, "\"", "")
}
