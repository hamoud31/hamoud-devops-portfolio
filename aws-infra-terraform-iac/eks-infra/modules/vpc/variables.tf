variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}
variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}
variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}
