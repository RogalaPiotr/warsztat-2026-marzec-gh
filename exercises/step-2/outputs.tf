output "resource_group_id" {
  value       = module.rg.id
  description = "Resource Group id"
}

output "virtual_network_id" {
  value       = module.vnet.id
  description = "Virtual Network id"
}

output "subnet_id" {
  value       = module.subnet.id
  description = "Subnet id"
}

output "network_interface_id" {
  value       = module.nic.id
  description = "Network Interface id"
}

output "storage_account_id" {
  value       = module.sa.id
  description = "Storage Account id"
}
