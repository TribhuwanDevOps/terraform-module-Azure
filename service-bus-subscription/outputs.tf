output "name" {
  value = "${azurerm_servicebus_subscription.azure_servicebus_subscription.name}"
}

output "id" {
  value = "${azurerm_servicebus_subscription.azure_servicebus_subscription.id}"
}

output "topic_primary_key" {
  value = "${azurerm_servicebus_topic_authorization_rule.auth_rule.primary_key}"
}

output "topic_primary_connection_string" {
  value = "${azurerm_servicebus_topic_authorization_rule.auth_rule.primary_connection_string}"
}

output "topic_secondary_key" {
  value = "${azurerm_servicebus_topic_authorization_rule.auth_rule.secondary_key}"
}

output "topic_secondary_connection_string" {
  value = "${azurerm_servicebus_topic_authorization_rule.auth_rule.secondary_connection_string}"
}