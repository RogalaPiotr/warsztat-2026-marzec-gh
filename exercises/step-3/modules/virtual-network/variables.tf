variable "name" {
  type        = string
  description = "Virtual Network name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the VNet"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the virtual network"
  default     = {}
}
