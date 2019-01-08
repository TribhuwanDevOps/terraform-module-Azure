locals {
  app_name = "${lower(replace(var.application,"/[ \\._]/","-"))}" # make name lowercase hypen seperated

  default_tags = {
    env         = "${var.environment}"
    area        = "${var.area_prefix}"
    application = "${local.app_name}"
    app_version = "${var.app_version}"
    deploy_timestamp   = "${timestamp()}"
  }
}

resource "azurerm_servicebus_subscription" "azure_servicebus_subscription" {
  name                = "${var.subscription_name}"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${var.servicebus_namespace_name}"
  topic_name          = "${var.servicebus_topic_name}"
  max_delivery_count  = "${var.max_delivery_count}"
}

resource "azurerm_servicebus_topic_authorization_rule" "auth_rule" {
  name                = "${var.subscription_name}-auth"
  namespace_name      = "${var.servicebus_namespace_name}"
  topic_name          = "${var.servicebus_topic_name}"
  resource_group_name = "${var.resource_group_name}"
  listen              = "${var.listen_policy}"
  send                = "${var.send_policy}"
  manage              = "${var.manage_policy}"
}