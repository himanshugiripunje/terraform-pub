provider "aws" {
  profile = var.ram
  region = var.aws_region
}
#lets create 10 s3 bucket
variable "s3_bucket_names" {
  type = list
  default = ["buck1.0", "buck2.0", "buck3.0", "buck4.0", "buck4.0", "buck5.0", "buck6.0", "buck7.0", "buck8.0", "buck9.0", "buck10.0"]
}
resource "aws_s3_bucket" "rugged_buckets" {
  count         = length(var.s3_bucket_names) //count will be 10
  bucket        = var.s3_bucket_names[count.index]
  acl           = "private"
  region        = "us-east-1"
  force_destroy = true
}