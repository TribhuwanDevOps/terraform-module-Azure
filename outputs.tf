output "name" {
  value = "${azurerm_app_service.app_service.name}"
}

output "id" {
  value = "${azurerm_app_service.app_service.id}"
}

output "default_site_hostname" {
  value = "${azurerm_app_service.app_service.default_site_hostname}"
}

output "outbound_ip_addresses" {
  value = "${azurerm_app_service.app_service.outbound_ip_addresses}"
}

output "site_credential" {
  value = "${azurerm_app_service.app_service.site_credential}"
}

output "identity" {
  value = "${azurerm_app_service.app_service.identity}"
}