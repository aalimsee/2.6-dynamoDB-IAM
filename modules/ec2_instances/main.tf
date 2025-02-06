resource "aws_instance" "my_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id] # <<<

  iam_instance_profile = var.iam_instance_profile


  tags = {
    Name = "aalimsee-tf-dynamoDB"
  }
} 

/* #AWS CLI command to associate IAM instance profile
aws ec2 associate-iam-instance-profile \
    --instance-id i-0e505252ddcdd5241 \
    --iam-instance-profile Name=aalimsee-DynamoDBInstanceProfile
*/

