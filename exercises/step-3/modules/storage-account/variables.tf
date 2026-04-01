variable "name" {
  type        = string
  description = "Storage Account name (globally unique, lowercase 3-24 chars)"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the storage account"
  default     = {}
}
