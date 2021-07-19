provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "BBG-test2" {
  ami = "ami-0ba62214afa52bec7"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-0783ee013eb20f7c4" ]
  key_name = "test-19-07"
  tags = {
    Name = "berenberg-and-eci-rock-SITIKANTHA"
  }
}
output "instance_ips" {
  value = aws_instance.BBG-test2.public_ip
}
