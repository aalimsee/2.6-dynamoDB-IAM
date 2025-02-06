# 2.6-dynamoDB-IAM
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile

# Test command after deployment
aws dynamodb list-tables
aws dynamodb scan --table-name <table-name>
aws dynamodb delete-table --table-name <table-name>

# Terraform will perform the following actions:

  # module.ec2_instances.aws_instance.my_ec2 will be created
  + resource "aws_instance" "my_ec2" {
      + ami                                  = "ami-0c614dee691cbbf37"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "aalimsee-DynamoDBInstanceProfile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "aalimsee-keypair"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = "subnet-09db4d55cd96155b4"
      + tags                                 = {
          + "Name" = "aalimsee-tf-dynamoDB"
        }
      + tags_all                             = {
          + "Name" = "aalimsee-tf-dynamoDB"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # module.iam_dynamodb.aws_iam_instance_profile.dynamodb_instance_profile will be created
  + resource "aws_iam_instance_profile" "dynamodb_instance_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "aalimsee-DynamoDBInstanceProfile"
      + name_prefix = (known after apply)
      + path        = "/"
      + role        = "aalimsee-tf-DynamoDBReadOnlyRole"
      + tags_all    = (known after apply)
      + unique_id   = (known after apply)
    }

  # module.iam_dynamodb.aws_iam_policy.dynamodb_read_policy will be created
  + resource "aws_iam_policy" "dynamodb_read_policy" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + description      = "IAM policy for reading from a specific DynamoDB table"
      + id               = (known after apply)
      + name             = "aalimsee-tf-DynamoDBReadSpecificPolicy"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "dynamodb:DescribeImport",
                          + "dynamodb:ListTables",
                          + "dynamodb:DescribeContributorInsights",
                          + "dynamodb:ListTagsOfResource",
                          + "dynamodb:GetAbacStatus",
                          + "dynamodb:DescribeReservedCapacityOfferings",
                          + "dynamodb:PartiQLSelect",
                          + "dynamodb:DescribeTable",
                          + "dynamodb:GetItem",
                          + "dynamodb:DescribeContinuousBackups",
                          + "dynamodb:DescribeExport",
                          + "dynamodb:ListImports",
                          + "dynamodb:GetResourcePolicy",
                          + "dynamodb:DescribeKinesisStreamingDestination",
                          + "dynamodb:ListExports",
                          + "dynamodb:DescribeLimits",
                          + "dynamodb:BatchGetItem",
                          + "dynamodb:ConditionCheckItem",
                          + "dynamodb:ListBackups",
                          + "dynamodb:Scan",
                          + "dynamodb:Query",
                          + "dynamodb:DescribeStream",
                          + "dynamodb:DescribeTimeToLive",
                          + "dynamodb:ListStreams",
                          + "dynamodb:ListContributorInsights",
                          + "dynamodb:DescribeGlobalTableSettings",
                          + "dynamodb:ListGlobalTables",
                          + "dynamodb:GetShardIterator",
                          + "dynamodb:DescribeGlobalTable",
                          + "dynamodb:DescribeReservedCapacity",
                          + "dynamodb:DescribeBackup",
                          + "dynamodb:DescribeEndpoints",
                          + "dynamodb:GetRecords",
                          + "dynamodb:DescribeTableReplicaAutoScaling",
                        ]
                      + Effect   = "Allow"
                      + Resource = [
                          + "*",
                          + "arn:aws:dynamodb:us-east-1:255945442255:table/aalimsee-tf-bookinventory",
                        ]
                      + Sid      = "VisualEditor0"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
    }

  # module.iam_dynamodb.aws_iam_role.dynamodb_role will be created
  + resource "aws_iam_role" "dynamodb_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "aalimsee-tf-DynamoDBReadOnlyRole"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # module.iam_dynamodb.aws_iam_role_policy.dynamodb_role_policy will be created
  + resource "aws_iam_role_policy" "dynamodb_role_policy" {
      + id          = (known after apply)
      + name        = "aalimsee-DynamoDBRolePolicy"
      + name_prefix = (known after apply)
      + policy      = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "dynamodb:DescribeImport",
                          + "dynamodb:ListTables",
                          + "dynamodb:DescribeContributorInsights",
                          + "dynamodb:ListTagsOfResource",
                          + "dynamodb:GetAbacStatus",
                          + "dynamodb:DescribeReservedCapacityOfferings",
                          + "dynamodb:PartiQLSelect",
                          + "dynamodb:DescribeTable",
                          + "dynamodb:GetItem",
                          + "dynamodb:DescribeContinuousBackups",
                          + "dynamodb:DescribeExport",
                          + "dynamodb:ListImports",
                          + "dynamodb:GetResourcePolicy",
                          + "dynamodb:DescribeKinesisStreamingDestination",
                          + "dynamodb:ListExports",
                          + "dynamodb:DescribeLimits",
                          + "dynamodb:BatchGetItem",
                          + "dynamodb:ConditionCheckItem",
                          + "dynamodb:ListBackups",
                          + "dynamodb:Scan",
                          + "dynamodb:Query",
                          + "dynamodb:DescribeStream",
                          + "dynamodb:DescribeTimeToLive",
                          + "dynamodb:ListStreams",
                          + "dynamodb:ListContributorInsights",
                          + "dynamodb:DescribeGlobalTableSettings",
                          + "dynamodb:ListGlobalTables",
                          + "dynamodb:GetShardIterator",
                          + "dynamodb:DescribeGlobalTable",
                          + "dynamodb:DescribeReservedCapacity",
                          + "dynamodb:DescribeBackup",
                          + "dynamodb:DescribeEndpoints",
                          + "dynamodb:GetRecords",
                          + "dynamodb:DescribeTableReplicaAutoScaling",
                        ]
                      + Effect   = "Allow"
                      + Resource = [
                          + "*",
                          + "arn:aws:dynamodb:us-east-1:255945442255:table/aalimsee-tf-bookinventory",
                        ]
                      + Sid      = "VisualEditor0"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role        = (known after apply)
    }

  # module.iam_dynamodb.aws_iam_role_policy_attachment.attach_dynamodb_policy will be created
  + resource "aws_iam_role_policy_attachment" "attach_dynamodb_policy" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "aalimsee-tf-DynamoDBReadOnlyRole"
    }

  # module.security_groups.aws_security_group.ec2_sg will be created
  + resource "aws_security_group" "ec2_sg" {
      + arn                    = (known after apply)
      + description            = "Allow SSH and HTTP access"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = "ec2_security_group"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "aalimsee-tf-MyEC2SecurityGroup"
        }
      + tags_all               = {
          + "Name" = "aalimsee-tf-MyEC2SecurityGroup"
        }
      + vpc_id                 = "vpc-0c00f5d96bc5520eb"
    }

Plan: 7 to add, 0 to change, 0 to destroy.
