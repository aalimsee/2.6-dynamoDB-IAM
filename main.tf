
module "dynamoDB" {
  source = "./modules/dynamoDB"
}

# create IAM for dynamoDB read only
module "iam_dynamoDB" {
  source = "./modules/iam_dynamoDB"
  //instance_id = var.instance_id
}

module "network" {
  source = "./modules/network"
}

# create SG
module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.network.vpcs[0]
}

# create EC2 instance in aalimsee-tf-vpc and public subnet, SG and dynamoDB instance profile
module "ec2_instances" {
  source = "./modules/ec2_instances"
  ami             = "ami-0c614dee691cbbf37"
  instance_type   = "t2.micro"
  key_name        = "aalimsee-keypair"
  subnet_id       = module.network.public_subnet_ids[0]
  security_group_id = module.security_groups.security_group_id
  iam_instance_profile = module.iam_dynamoDB.dynamodb_instance_profile_name
}
