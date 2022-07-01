provider "aws" {
  profile = "ram"
  region = "us-east-1"
}
resource "aws_s3_bucket" "m" {
  bucket = "buck1.0"
  acl = "private"
}
resource "aws_s3_bucket" "c" {
  bucket = "buck1.2"
  acl = "private"
}
resource "aws_s3_bucket" "d" {
  bucket = "buck1.3"
  acl = "private"
}
resource "aws_s3_bucket" "e" {
  bucket = "buck1.4"
  acl = "private"
}
resource "aws_s3_bucket" "f" {
  bucket = "buck1.5"
  acl = "private"
}
resource "aws_s3_bucket" "g" {
  bucket = "buck1.6"
  acl = "private"
}
resource "aws_s3_bucket" "h" {
  bucket = "buck1.7"
  acl = "private"
}
resource "aws_s3_bucket" "i" {
  bucket = "buck1.8"
  acl = "private"
}
