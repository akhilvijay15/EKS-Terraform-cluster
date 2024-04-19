module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks_cluster-vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.azs.names
  public_subnets  = var.public_subnets
  private_subnets  = var.private_subnets

  enable_dns_hostnames = true
  enable_nat_gateway = true
  single_nat_gateway = true


  tags = {
    Name = "k8's_cluster_vpc"
    Terraform = "true"
    Environment = "dev"
  }

  public_subnet_tags = {
    Name : "k8's-public_subnet"
  
}

  private_subnet_tags = {
    Name : "k8's-private_subnet"
  
}

}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = var.private_subnets
  control_plane_subnet_ids = var.private_subnets




  eks_managed_node_groups = {
    nodes = {
      min_size     = 2
      max_size     = 3
      desired_size = 2

      instance_types = var.instance_types
         
    }
  }  
  tags = {
    Name = "Eks_cluster_instance"
    Environment = "dev"
    Terraform = "true"
  }

} 

