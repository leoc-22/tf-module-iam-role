module "amplify_and_cognito_admin" {
  source = "../.."

  name_prefix              = "amplifyAdmin"
  role_path                = "/human/"
  role_description         = "Role for granting admin access on Amplify"
  existing_iam_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess-Amplify"]
  arns_assume_role         = ["arn:aws:iam::000000000000:root"]
}
