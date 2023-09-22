data "aws_iam_policy_document" "ecs_infra_role_policy" {
  statement {
    resources = ["arn:aws:s3:::ecs-infrastructre"]
    actions = [
      "s3:ListBucket",
    ]
  }

  statement {
    resources = ["arn:aws:s3:::ecs-infrastructre/*"]
    actions = [
      "s3:Get*",
      "s3:Put*",
      "s3:Delete*",
    ]
  }

  statement {
    resources = ["arn:aws:iam::000000000000:role/service_roles/*"]
    actions   = ["iam:PassRole"]
  }

  // enable VPCs, subnets, route tables and internet gateways creation
  statement {
    resources = ["*"]
    actions = [
      "ec2:Describe*",
      "ec2:Create*",
      "ec2:Delete*",
      "ec2:AttachInternetGateway",
      "ec2:AssociateRouteTable",
      "ec2:ModifyVpcAttribute",
      "ec2:DisableVpcClassicLink",
      "ec2:DisableVpcClassicLinkDnsSupport",
      "ec2:EnableVpcClassicLink",
      "ec2:EnableVpcClassicLinkDnsSupport",
    ]
  }
}

module "devops_infra_deploy" {
  source = "../.."

  name_prefix         = "ecsInfraDeploy"
  role_path           = "/ecs/"
  role_description    = "Role for deploying ECS infrastructure"
  iam_policy_document = data.aws_iam_policy_document.ecs_infra_role_policy.json
  arns_assume_role    = ["arn:aws:iam::000000000000:root"]
}
