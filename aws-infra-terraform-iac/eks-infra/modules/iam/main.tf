resource "aws_iam_role" "eks_cluster" {
  name = "eksClusterRole"
  assume_role_policy = data.aws_iam_policy_document.eks_cluster.json
}

resource "aws_iam_role" "eks_nodes" {
  name = "eksNodeRole"
  assume_role_policy = data.aws_iam_policy_document.eks_nodes.json
}
