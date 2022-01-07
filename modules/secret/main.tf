data "aws_secretsmanager_secret" "env_secrets" {
  name = "secret"
  depends_on = [
    aws_secretsmanager_secret.credentials
  ]
}
data "aws_secretsmanager_secret_version" "current_secrets" {
  secret_id = data.aws_secretsmanager_secret.env_secrets.id
}
resource "aws_secretsmanager_secret" "credentials" {
  name = "secret"
}
resource "aws_secretsmanager_secret_version" "version" {
  secret_id     = aws_secretsmanager_secret.credentials.id
  secret_string = var.password
}
