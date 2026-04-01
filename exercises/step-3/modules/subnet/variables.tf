variable "name" {
  type        = string
  description = "Subnet name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "virtual_network_name" {
  type        = string
  description = "Virtual Network name"
}

variable "address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the subnet"
}
