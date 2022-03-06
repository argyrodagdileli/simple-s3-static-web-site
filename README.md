# Simple Static Site Hosted on S3
This is a very simple project that utilizes Terraform to deploy an S3 Bucket and a Cloudfront distribution to host a static site.
This project was created as part of experimentation with Terraform.
The static side was created using [Slides by DesignModo] 

## Usage
Extract the site files from `site.zip`
Deploy the resources to AWS using Terraform
```sh 
terraform -chdir=manifests/ apply
```

Copy the contents of `site/` to your S3 bucket
```sh 
aws s3 cp --recursive site/* s3://<bucket_name>/
```
## Variables
|Name  | Description   | Example  | Default Value   |  
|---|---|---|---|
| aws_region  | The AWS region in which the resources will be deployed  | us-east-1  | us-east-1   | 
| bucket_name  | The name of the bucket that will host your static site. Must be universally unique  | my-bucket  | Empty string. Results in a randomly generated name  |
| common_tags  | Common tags for the resources to be deployed on AWS  | {"Environment" = "Dev"} | {}  |
| index_document  | The landing page of the site | index.html  |  index.html |
| error_document  | The document to return in case of a 4XX error | 404.html   | 404.html  |

[//]: # (Reference links used in the body)

   [Slides by DesignModo]: <https://designmodo.com/slides/>