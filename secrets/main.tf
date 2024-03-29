resource "aws_secretsmanager_secret" "main" {
    name                        = "${var.name}_${var.environment}"
    description                 = "${var.description}"

    tags = {
        terraform               = true
        environment             = var.environment
    }
}

resource "aws_secretsmanager_secret_version" "main" {
    secret_id                   = aws_secretsmanager_secret.main.id
    secret_string               = jsonencode(var.secret_string)
}