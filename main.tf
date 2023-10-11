data "aws_caller_identity" "current" {}

resource "aws_iam_role" "custom_role" {
  name               = "${var.name_prefix}Role"
  path               = var.role_path
  description        = var.role_description
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "custom_policy" {
  for_each = var.iam_policy_document == "" ? {} : { "policy" : true }

  name   = "${var.name_prefix}Policy"
  path   = "/"
  policy = var.iam_policy_document
}

resource "aws_iam_policy_attachment" "custom_policy_attachment" {
  for_each = var.iam_policy_document == "" ? {} : { "attachment" : true }

  name       = "${var.name_prefix}Attachment"
  roles      = [aws_iam_role.custom_role.name]
  policy_arn = aws_iam_policy.custom_policy["policy"].arn

  depends_on = [aws_iam_role.custom_role, aws_iam_policy.custom_policy]
}

resource "aws_iam_role_policy_attachment" "existing_policy_attachment" {
  for_each = var.existing_iam_policy_arns == [] ? toset([]) : toset(var.existing_iam_policy_arns)

  role       = aws_iam_role.custom_role.name
  policy_arn = each.key

  depends_on = [aws_iam_role.custom_role]
}
