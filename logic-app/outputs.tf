output "name" {
  value = "${azurerm_logic_app_workflow.workflow.name}"
}

output "id" {
  value = "${azurerm_logic_app_workflow.workflow.id}"
}

output "access_endpoint" {
  value = "${azurerm_logic_app_workflow.workflow.access_endpoint}"
}