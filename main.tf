module "iam_dynamodb" {
  source = "./modules/iam_dynamodb"
  //instance_id = var.instance_id
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = "vpc-0c00f5d96bc5520eb"
}

module "ec2_instances" {
  source = "./modules/ec2_instances"
  ami             = "ami-0c614dee691cbbf37"
  instance_type   = "t2.micro"
  key_name        = "aalimsee-keypair"
  subnet_id       = "subnet-09db4d55cd96155b4"
  security_group_id = module.security_groups.security_group_id
  iam_instance_profile = module.iam_dynamodb.dynamodb_instance_profile_name
}