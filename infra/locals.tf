locals {
  env = terraform.workspace

  docker_compose = templatefile("./templates/docker-compose.yml",{
    AWS_ACCOUNT_NUMBER = var.aws_account_number
  })
  deploy = templatefile("./templates/deploy.sh",{
    AWS_ACCOUNT_NUMBER = var.aws_account_number
  })
}