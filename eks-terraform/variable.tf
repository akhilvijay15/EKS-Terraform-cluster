variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
}

variable "public_subnets" {
  description = "Public_Subnets_CIDR"
  type = list(string)
}

variable "private_subnets" {
  description = "Public_Subnets_CIDR"
  type = list(string)
}

variable "instance_types" {
  description = "eks_nodes_instance"
  type = list(string)
}