# Creates s3 bucket to store files for hosting website
resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name

  tags = var.common_tags
}

# Enable Static Website Hosting Configuration to bucket
resource "aws_s3_bucket_website_configuration" "website_bucket" {
  bucket = aws_s3_bucket.static_website.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.acl]
}


# Defines static_website ownership
resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.static_website.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Explicitly disables S3 default security settings
resource "aws_s3_bucket_acl" "acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.owner,
    aws_s3_bucket_public_access_block.access,
  ]

  bucket = aws_s3_bucket.static_website.id
  acl    = "private"
}

# Allow public bucket access
resource "aws_s3_bucket_public_access_block" "access" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls    = true
  block_public_policy  = true
  ignore_public_acls   = true
  restrict_public_buckets = true
}