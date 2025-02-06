// modules/iam_dynamodb/outputs.tf
output "role_arn" {
  description = "The ARN of the IAM role."
  value       = aws_iam_role.dynamodb_role.arn
}

output "policy_arn" {
  description = "The ARN of the IAM policy."
  value       = aws_iam_policy.dynamodb_read_policy.arn
}

output "instance_profile_arn" {
  description = "The ARN of the IAM instance profile."
  value       = aws_iam_instance_profile.dynamodb_instance_profile.arn
}

output "dynamodb_instance_profile_name" {
  value = aws_iam_instance_profile.dynamodb_instance_profile.name
}

/*
https://developer.hashicorp.com/terraform/language/values/outputs
Output values make information about your infrastructure available on the command line, and can expose information for other Terraform configurations to use. Output values are similar to return values in programming languages.

Output values have several uses:
- A child module can use outputs to expose a subset of its resource attributes to a parent module.
- A root module can use outputs to print certain values in the CLI output after running terraform apply.
- When using remote state, root module outputs can be accessed by other configurations via a terraform_remote_state data source.
*/