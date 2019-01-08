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


resource "azurerm_servicebus_topic" "servicebus_topic" {
  name                = "${var.topic_name}"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.servicebus_namespace.name}"
  enable_partitioning = "${var.partitioning}"
}

resource "azurerm_servicebus_topic_authorization_rule" "auth_rule" {
  name                = "${azurerm_servicebus_topic.servicebus_topic.name}-auth"
  namespace_name      = "${azurerm_servicebus_namespace.servicebus_namespace.name}"
  topic_name          = "${azurerm_servicebus_topic.servicebus_topic.name}"
  resource_group_name = "${var.resource_group_name}"
  listen              = "${var.listen_policy}"
  send                = "${var.send_policy}"
  manage              = "${var.manage_policy}"
}