output "name" {
  value = "${azurerm_storage_account.storage_account.name}"
}

output "id" {
  value = "${azurerm_storage_account.storage_account.id}"
}

output "primary_connection_string" {
  value = "${azurerm_storage_account.storage_account.primary_connection_string}"
}

output "secondary_connection_string" {
  value = "${azurerm_storage_account.storage_account.secondary_connection_string}"
}