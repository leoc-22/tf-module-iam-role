data "aws_caller_identity" "current" {}

resource "aws_iam_role" "custom_role" {
  name               = "${var.name_prefix}Role"
  path               = var.role_path
  description        = var.role_description
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "custom_policy" {
  name   = "${var.name_prefix}Policy"
  path   = "/"
  policy = var.iam_policy_document
}

resource "aws_iam_policy_attachment" "custom_attachment" {
  name       = "${var.name_prefix}Attachment"
  roles      = [aws_iam_role.custom_role.name]
  policy_arn = aws_iam_policy.custom_policy.arn
  depends_on = [aws_iam_role.custom_role, aws_iam_policy.custom_policy]
}
