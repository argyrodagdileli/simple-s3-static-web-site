output "bucket_name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.site-bucket.id
}

output "bucket_endpoint" {
  description = "Bucket endpoint"
  value       = aws_s3_bucket.site-bucket.website_endpoint
}

output "cloudfront_endpoint" {
  description = "Cloudfront endpoint"
  value       = aws_cloudfront_distribution.dist.domain_name
}
