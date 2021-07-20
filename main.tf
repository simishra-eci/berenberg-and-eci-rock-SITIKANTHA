provider "aws" {
  region = "us-east-2"
}

module "network" {
  source = "./modules/network"
  availability_zone = "us-east-2b"
  vpc_name = "BBG-VPC1"
  vpc_subnet_name= "BBG-SUBNET1"
}

module "compute" {
  source = "./modules/compute"
  instance_name = "bbg-and-eci-rock-SITIKANTHA"
  subnet_id = "${module.network.subnet_id}" 
  sg_id = "${module.network.sg_id}"
}
