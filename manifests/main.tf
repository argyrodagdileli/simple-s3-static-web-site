#---------------------------------
# S3 Bucket
#---------------------------------  
resource "aws_s3_bucket" "site-bucket" {
  bucket = var.bucket_name

}

resource "aws_s3_bucket_acl" "site-bucket-acl" {
  bucket = aws_s3_bucket.site-bucket.bucket
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "site-documents" {
  bucket = aws_s3_bucket.site-bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site-bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.site-bucket.arn,
          "${aws_s3_bucket.site-bucket.arn}/*",
        ]
      },
    ]
  })
}

#---------------------------------
# Cloudfront Distribution
#---------------------------------
resource "aws_cloudfront_distribution" "dist" {
  enabled = true
  origin {
    domain_name = aws_s3_bucket.site-bucket.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.site-bucket.bucket_regional_domain_name
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.site-bucket.bucket_regional_domain_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

}