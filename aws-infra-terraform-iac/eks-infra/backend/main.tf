provider "aws" {
    region = "francecentral-1"
  
}

resource "aws_s3_bucket" "eks_bucket_remote_state" {
  bucket = "remote-tf-state-eks-bucket"

  tags = {
    Name        = "eks-bucket-remote-state"
  }
}

resource "aws_s3_bucket_versioning" "eks_bucket_versioning" {
  bucket = aws_s3_bucket.eks_bucket_remote_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "eks_bucket_encryption" {
  bucket = aws_s3_bucket.eks_bucket_remote_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"   # Free, AWS-managed encryption
    }
  }
}

resource "aws_s3_bucket_public_access_block" "eks_bucket_public_access" {
  bucket = aws_s3_bucket.eks_bucket_remote_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "eks_lock_table" {
  name         = "eks-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Name        = "eks-lock-table" 
  }
}
