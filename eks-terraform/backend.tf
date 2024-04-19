terraform {
  backend "s3" {
    bucket = "aws-terraform-202404"
    key    = "eks_cluster/terraform.tfstate"
    region = "ap-south-1"
  }
}