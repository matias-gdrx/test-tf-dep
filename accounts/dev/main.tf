provider "aws" {
  region = "us-west-2"
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  bucket = "my-s3-bucket-test-tf-matias"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

module "rds" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "6.2.0"

  name = "myrdsdb"
}