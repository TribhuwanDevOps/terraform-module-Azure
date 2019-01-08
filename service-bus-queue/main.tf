locals {
  app_name = "${lower(replace(var.application,"/[ \\._]/","-"))}" # make name lowercase hypen seperated
  name = "${var.environment}-${local.app_name}-sb-namespace"

  default_tags = {
    env         = "${var.environment}"
    area        = "${var.area_prefix}"
    application = "${local.app_name}"
    app_version = "${var.app_version}"
    deploy_timestamp   = "${timestamp()}"
  }
}

resource "azurerm_servicebus_namespace" "servicebus_namespace" {
  name = "${local.name}"
  location = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  sku = "${var.sku}"
  tags = "${merge(local.default_tags, var.tags)}"
}


resource "azurerm_servicebus_queue" "servicebus_queue" {
  name                = "${local.app_name}-queue"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.servicebus_namespace.name}"

  enable_partitioning = true
}


resource "azurerm_servicebus_queue_authorization_rule" "queue_authrule" {
  name                = "${azurerm_servicebus_queue.servicebus_queue.name}-authrule"
  namespace_name      = "${azurerm_servicebus_namespace.servicebus_namespace.name}"
  queue_name          = "${azurerm_servicebus_queue.servicebus_queue.name}"
  resource_group_name = "${var.resource_group_name}"

  listen              = "${var.listen_policy}"
  send                = "${var.send_policy}"
  manage              = "${var.manage_policy}"
}