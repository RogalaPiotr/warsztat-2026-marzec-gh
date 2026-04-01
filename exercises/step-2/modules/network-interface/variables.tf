variable "name" {
  type        = string
  description = "Network Interface name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet resource id"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the network interface"
  default     = {}
}
