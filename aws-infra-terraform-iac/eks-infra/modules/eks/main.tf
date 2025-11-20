resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = module.iam.eks_cluster_role_arn

  vpc_config {
    subnet_ids = module.vpc.subnet_ids
  }

  depends_on = [module.iam]
}
