module "vpc" {
  source     = "./modules/vpc"
  vpc_cidr   = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  azs        = ["eu-west-1a", "eu-west-1b"]
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = "my-eks-cluster"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.subnet_ids
}

module "node_groups" {
  source       = "./modules/node_groups"
  cluster_name = module.eks.cluster_name
  subnet_ids   = module.vpc.subnet_ids
}
