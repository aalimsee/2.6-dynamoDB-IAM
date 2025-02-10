# Fetch the VPC ID by name
data "aws_vpcs" "filtered_vpcs" {
  filter {
    name   = "tag:Name"
    values = ["*aalimsee*"]
  }
}
output "vpcs" {value = data.aws_vpcs.filtered_vpcs.ids}

# Fetch public subnets for the filtered VPC
#==========================================
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.filtered_vpcs.ids
  }
  tags = {
    Name = "*aalimsee*public*"
  }
}
output "public_subnet_ids" {value = data.aws_subnets.public.ids}
output "public_subnet_id1" {value = data.aws_subnets.public.ids[0]}

