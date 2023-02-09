resource "aws_s3_bucket" "rokhun-tf-state" {
  bucket = "tfstate.rokhun.com"

  tags = {
    Environment = "rokhun"
    Terraform   = "true"
  }
}

resource "aws_s3_bucket_acl" "rokhun-tf-state_bucket_acl" {
  bucket = aws_s3_bucket.rokhun-tf-state.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "rokhun-tf-state_bucket_public" {
  bucket = aws_s3_bucket.rokhun-tf-state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
