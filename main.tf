module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "test-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false


}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "test-instance"
  subnet_id     = "${module.vpc.public_subnets[0]}"
  ami = "ami-0de8f6a2a6d5f4b3c"
}