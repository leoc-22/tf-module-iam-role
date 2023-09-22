data "aws_iam_policy_document" "lambda_policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"]
  }
}

module "lambda_auto_link_data_iam_role" {
  source = "../.."

  name_prefix          = "myLambda"
  role_path            = "/service_roles/"
  role_description     = "Allows resources to log to log groups"
  iam_policy_document  = data.aws_iam_policy_document.lambda_policy.json
  services_assume_role = ["lambda.amazonaws.com"]
}
