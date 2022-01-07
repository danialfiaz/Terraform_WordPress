output "secret_id"{
    value= data.aws_secretsmanager_secret_version.current_secrets
}