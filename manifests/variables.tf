#---------------------------------
# Commons
#---------------------------------  

variable "aws_region" {
  type        = string
  description = "The AWS region to put the bucket into. Defaults to us-east-1."
  default     = "us-east-1"
}

variable "common_tags" {
  type        = map(string)
  description = "Tags to be shared across all deployed resources."
  default     = {}
}

#---------------------------------
# S3 Bucket
#---------------------------------  
variable "bucket_name" {
  type        = string
  description = "The name of the bucket that will host the static site."
  default     = null
}

# Site-related configs
variable "index_document" {
  description = "The landing page of the site. Defaults to index.html"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The document to return in case of a 4XX error. Defaults to 404.html"
  type        = string
  default     = "404.html"
}

