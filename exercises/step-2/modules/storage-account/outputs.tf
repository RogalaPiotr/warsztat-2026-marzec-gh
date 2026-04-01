output "id" {
  value       = azurerm_storage_account.this.id
  description = "Storage Account id"
}

output "name" {
  value       = azurerm_storage_account.this.name
  description = "Storage Account name"
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.this.primary_blob_endpoint
  description = "Primary blob endpoint"
}
