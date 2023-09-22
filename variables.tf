variable "name_prefix" {
  default     = ""
  description = "Name prefix for IAM role name"
  type        = string
}

variable "role_path" {
  default     = ""
  description = "An optional IAM role path"
  type        = string
}

variable "role_description" {
  default     = ""
  description = "An optional IAM role description"
  type        = string
}

variable "iam_policy_document" {
  default     = ""
  description = "Custom IAM policy document"
  type        = string
}

variable "arns_assume_role" {
  default     = []
  type        = list(string)
  description = "List of ARNs of IAM entities that can assume the role"
}

variable "services_assume_role" {
  default     = []
  type        = list(string)
  description = "List of services that can assume the role"
}
