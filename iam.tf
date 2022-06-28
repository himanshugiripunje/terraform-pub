provider "aws" {
  region = "ap-south-1"
  profile = "ram"
}
resource "aws_iam_user" "lc" {
  name = "devid"
  path = "/limit/"
}
resource "aws_iam_user" "ld" {
  name = "nelson"
  path = "/limit/"
}
resource "aws_iam_user" "le" {
  name = "jai"
  path = "/limit/"
}
resource "aws_iam_user" "lf" {
  name = "ridhi"
  path = "/limit/"
}
resource "aws_iam_user" "lg" {
  name = "munna"
  path = "/limit/"
}
resource "aws_iam_user" "lb" {
  name = "lenon"
  path = "/limit/"
}
