data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.arns_assume_role
    }

    principals {
      type        = "Service"
      identifiers = var.services_assume_role
    }
  }
}
