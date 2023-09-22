variable "name_prefix" {
  type        = string
  description = "Name prefix for IAM role name"
  default     = ""
}

variable "role_path" {
  type        = string
  description = "An optional IAM role path"
  default     = ""
}

variable "role_description" {
  type        = string
  description = "An optional IAM role description"
  default     = ""
}

variable "iam_policy_document" {
  type        = string
  description = "Custom IAM policy document"
  default     = ""
}

variable "existing_iam_policy_arns" {
  type        = list(string)
  description = "List of ARNs of existing IAM policies"
  default     = []
}

variable "arns_assume_role" {
  type        = list(string)
  description = "List of ARNs of IAM entities that can assume the role"
  default     = []
}

variable "services_assume_role" {
  type        = list(string)
  description = "List of services that can assume the role"
  default     = []
}
