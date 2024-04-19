terraform {
  backend "s3" {
    bucket = "aws-terraform-202404"
    key    = "jenkins/terraform.tfstate"
    region = "ap-south-1"
  }
}