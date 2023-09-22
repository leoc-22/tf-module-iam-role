# Terraform Module: IAM Role

This is a Terraform module for creating custom AWS IAM roles.

## Install

- pre-commit
  - install [pre-commit](https://pre-commit.com)
  - run `pre-commit install` locally

## Usage

This module creates an IAM Role and its policy document.
You need to pass your custom policy document to the module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.custom_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.custom_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arns_assume_role"></a> [arns\_assume\_role](#input\_arns\_assume\_role) | List of ARNs of IAM entities that can assume the role | `list(string)` | `[]` | no |
| <a name="input_iam_policy_document"></a> [iam\_policy\_document](#input\_iam\_policy\_document) | Custom IAM policy document | `string` | `""` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix for IAM role name | `string` | `""` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | An optional IAM role description | `string` | `""` | no |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | An optional IAM role path | `string` | `""` | no |
| <a name="input_services_assume_role"></a> [services\_assume\_role](#input\_services\_assume\_role) | List of services that can assume the role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | IAM role ARN |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | IAM role name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
