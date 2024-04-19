variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
}

variable "public_subnets" {
  description = "Public_Subnets_CIDR"
  type = list(string)
}

variable "instance_type" {
  description = "INSTANCE_TYPE"
  type = string
}