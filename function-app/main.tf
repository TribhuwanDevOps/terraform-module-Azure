locals {
  app_name = "${lower(replace(var.application,"/[ \\._]/","-"))}" # make name lowercase hypen seperated
  name = "${var.environment}-${local.app_name}-func"
  
  default_tags = {
    env         = "${var.environment}"
    area        = "${var.area_prefix}"
    application = "${local.app_name}"
    app_version = "${var.app_version}"
    deploy_timestamp   = "${timestamp()}"
  }
}

resource "azurerm_function_app" "function_app" {
  name                      = "${local.name}"
  location                  = "${var.location}"
  resource_group_name       = "${var.resource_group_name}"
  app_service_plan_id       = "${var.app_service_plan_id}"
  storage_connection_string = "${var.storage_primary_connection_string}"
  client_affinity_enabled   = "${var.client_affinity_enabled}"
  version                   = "${var.version}"
  app_settings              = "${var.app_settings}"
  tags                      = "${merge(local.default_tags, var.tags)}"
}