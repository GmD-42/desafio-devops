locals {
  env = terraform.workspace

  docker_compose = templatefile("./templates/docker-compose.yaml", {
    AWS_ACCOUNT_NUMBER         = var.aws_account_number,
    GF_SECURITY_ADMIN_USER     = var.grafana_user,
    GF_SECURITY_ADMIN_PASSWORD = var.grafana_password
  })
  deploy = templatefile("./templates/deploy.sh", {
    AWS_ACCOUNT_NUMBER = var.aws_account_number
  })
  prometeus_config = templatefile("./templates/prometheus/config.yaml", {})
}
