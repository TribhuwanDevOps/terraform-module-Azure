output "name" {
  value = "${azurerm_servicebus_queue.servicebus_queue.name}"
}

output "id" {
  value = "${azurerm_servicebus_queue.servicebus_queue.id}"
}

output "queue_primary_key" {
  value = "${azurerm_servicebus_queue_authorization_rule.queue_authrule.primary_key}"
}

output "queue_primary_connection_string" {
  value = "${azurerm_servicebus_queue_authorization_rule.queue_authrule.primary_connection_string}"
}

output "queue_secondary_key" {
  value = "${azurerm_servicebus_queue_authorization_rule.queue_authrule.secondary_key}"
}

output "queue_secondary_connection_string" {
  value = "${azurerm_servicebus_queue_authorization_rule.queue_authrule.secondary_connection_string}"
}