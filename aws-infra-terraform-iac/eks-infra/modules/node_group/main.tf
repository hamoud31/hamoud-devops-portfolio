resource "aws_eks_node_group" "this" {
  for_each = var.node_groups
  cluster_name    = module.eks.cluster_name
  node_group_name = each.key
  node_role_arn   = module.iam.eks_node_role_arn
  subnet_ids      = module.vpc.subnet_ids
  instance_types = each.value.instance_types
  capacity_type  = each.value.capacity_type

  scaling_config {
    desired_size = each.value.scaling_config.desired_size
    max_size =  each.value.scaling_config.max_size 
    min_size = each.value.scaling_config.min_size
  }
  
    depends_on = [module.eks, module.iam, module.vpc]
    }
  