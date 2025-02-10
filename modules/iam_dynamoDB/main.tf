// modules/iam_dynamodb/main.tf
resource "aws_iam_policy" "dynamodb_read_policy" {
  name        = "aalimsee-tf-DynamoDBReadSpecificPolicy"
  description = "IAM policy for reading from a specific DynamoDB table"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "dynamodb:DescribeImport",
                "dynamodb:ListTables",
                "dynamodb:DescribeContributorInsights",
                "dynamodb:ListTagsOfResource",
                "dynamodb:GetAbacStatus",
                "dynamodb:DescribeReservedCapacityOfferings",
                "dynamodb:PartiQLSelect",
                "dynamodb:DescribeTable",
                "dynamodb:GetItem",
                "dynamodb:DescribeContinuousBackups",
                "dynamodb:DescribeExport",
                "dynamodb:ListImports",
                "dynamodb:GetResourcePolicy",
                "dynamodb:DescribeKinesisStreamingDestination",
                "dynamodb:ListExports",
                "dynamodb:DescribeLimits",
                "dynamodb:BatchGetItem",
                "dynamodb:ConditionCheckItem",
                "dynamodb:ListBackups",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:DescribeStream",
                "dynamodb:DescribeTimeToLive",
                "dynamodb:ListStreams",
                "dynamodb:ListContributorInsights",
                "dynamodb:DescribeGlobalTableSettings",
                "dynamodb:ListGlobalTables",
                "dynamodb:GetShardIterator",
                "dynamodb:DescribeGlobalTable",
                "dynamodb:DescribeReservedCapacity",
                "dynamodb:DescribeBackup",
                "dynamodb:DescribeEndpoints",
                "dynamodb:GetRecords",
                "dynamodb:DescribeTableReplicaAutoScaling"
            ],
            "Resource": [
                "*",
                "arn:aws:dynamodb:us-east-1:255945442255:table/aalimsee-tf-bookinventory"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role" "dynamodb_role" {
  name = "aalimsee-tf-DynamoDBReadOnlyRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

/* # Type - Customer inline
resource "aws_iam_role_policy" "dynamodb_role_policy" {
  name   = "aalimsee-DynamoDBRolePolicy"
  role   = aws_iam_role.dynamodb_role.id
  policy = aws_iam_policy.dynamodb_read_policy.policy
} */
resource "aws_iam_role_policy_attachment" "attach_dynamodb_policy" {
  role       = aws_iam_role.dynamodb_role.name
  policy_arn = aws_iam_policy.dynamodb_read_policy.arn

}

resource "aws_iam_instance_profile" "dynamodb_instance_profile" {
  name = "aalimsee-DynamoDBInstanceProfile"
  role = aws_iam_role.dynamodb_role.name
}



