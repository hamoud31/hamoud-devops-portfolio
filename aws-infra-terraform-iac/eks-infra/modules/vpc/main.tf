resource "aws_vpc" "eks-vpc-main" {
  cidr_block = var.vpc_cidr_block
    enable_dns_hostnames = true
    enable_dns_support   = true
   tags = {
    Name  = "${var.cluster_name}-vpc"
    "kubernetes.io/cluster/${var.cluster_name}"   = "shared"
  }
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.eks-vpc-main.id
  cidr_block        = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.azs[count.index]
  tags = { Name = "eks-public-${count.index}" }
}
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.eks-vpc-main.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = { Name = "eks-private-${count.index}" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks-vpc-main.id
  tags = { Name = "eks-igw" }
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.eks-vpc-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  tags = { Name = "eks-public-rt"}

}
}
resource "aws_route_table_association" "public_rt_assoc" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_nat_gateway" "nat" {
  count         = length(var.public_subnets)
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags = { Name = "eks-nat-${count.index}" }
}
resource "aws_eip" "nat_eip" {
  count = length(var.public_subnets)
  vpc   = true
  tags = { Name = "eks-nat-eip-${count.index}" }
}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.eks-vpc-main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[0].id
  }
  tags = { Name = "eks-private-rt" }
}
resource "aws_route_table_association" "private_rt_assoc" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
