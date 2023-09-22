output "role_name" {
  description = "IAM role name"
  value       = aws_iam_role.custom_role.name
}

output "role_arn" {
  description = "IAM role ARN"
  value       = aws_iam_role.custom_role.arn
}
