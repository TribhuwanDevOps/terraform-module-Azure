output "name" {
  value = "${azurerm_function_app.function_app.name}"
}

output "id" {
  value = "${azurerm_function_app.function_app.id}"
}

output "function_site_credential" {
  value = "${azurerm_function_app.function_app.site_credential}"
}

output "function_connection_string" {
  value = "${azurerm_function_app.function_app.connection_string}"
}