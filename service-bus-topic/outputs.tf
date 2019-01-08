output "id" {
  value = "${azurerm_servicebus_topic.servicebus_topic.id}"
}

output "name" {
  value = "${azurerm_servicebus_topic.servicebus_topic.name}"
}

output "topic_auth_rule_name" {
  value = "${azurerm_servicebus_topic_authorization_rule.auth_rule.name}"
}

output "topic_auth_rule_primary_key" {
  value = "${azurerm_servicebus_topic_authorization_rule.auth_rule.primary_key}"
}

output "topic_auth_rule_primary_connection_string" {
  value = "${azurerm_servicebus_topic_authorization_rule.auth_rule.primary_connection_string}"
}

output "topic_auth_rule_secondary_key" {
  value = "${azurerm_servicebus_topic_authorization_rule.auth_rule.secondary_key}"
}

output "topic_auth_rule_secondary_connection_string" {
  value = "${azurerm_servicebus_topic_authorization_rule.auth_rule.secondary_connection_string}"
}

output "servicebus_namespace_name" {
  value = "${azurerm_servicebus_namespace.servicebus_namespace.name}"
}

output "servicebus_namespace_endpoint" {
  value = "sb://${azurerm_servicebus_namespace.servicebus_namespace.name}.servicebus.windows.net/"
}