terraform {
  backend "s3" {
    bucket = "gmd-lab-terraform"
    key    = "api/terraform-state"
    region = "us-east-1"
  }
}  