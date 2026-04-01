variable "subscription_id" {
  type        = string
  description = "Subscription ID dla wdrożeń Terraform"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID (Microsoft Entra)"
}

variable "location" {
  type        = string
  description = "Azure region for all resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "vnet_name" {
  type        = string
  description = "Virtual Network name"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for VNet (e.g., [\"10.0.0.0/16\"])"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Subnet address prefixes (e.g., [\"10.0.1.0/24\"])"
}

variable "nic_name" {
  type        = string
  description = "Network Interface name"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account name (globally unique, lowercase 3-24 chars)"
}

variable "tags" {
  type        = map(string)
  description = "Tagi stosowane do zasobów"
}
