module "vpc" {
 source = "../../modules/vpc"
 cidr_block     = var.vpc_cidr
 public_subnets = var.public_subnets
}
module "eks" {
 source = "../../modules/eks"
 cluster_name = "dev-eks-cluster"
 cluster_role = var.cluster_role
 subnet_ids   = module.vpc.public_subnets
}
module "ecr" {
 source = "../../modules/ecr"
}