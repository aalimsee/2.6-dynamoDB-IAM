variable "vpc_id" {}

//variable "security_group_id" {}
output "security_group_id" {
    value = aws_security_group.ec2_sg.id
}
