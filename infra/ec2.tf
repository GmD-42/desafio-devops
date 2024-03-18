data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "api" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.api_ec2.name]
  availability_zone    = "us-east-1a"
  iam_instance_profile = aws_iam_instance_profile.api_profile.name

  user_data = templatefile("./templates/cloud-init.yaml", {
    B64_DOCKER_COMPOSE    = base64encode(local.docker_compose),
    B64_DEPLOY            = base64encode(local.deploy),
    B64_PROMETHEUS_CONFIG = filebase64("./templates/prometheus/config.yaml"),
    AWS_ACCOUNT_NUMBER    = var.aws_account_number,
    ssh-key               = var.ssh-key
  })

}

