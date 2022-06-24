#configure the aws provider
provider "aws" {
  profile = "ram"
  region = "ap-south-1"
}
#configure the aws resources
resource "aws_instance" "webserver" {
  ami = "ami-08df646e18b182346"
  instance_type = "t2.micro"
 
}
