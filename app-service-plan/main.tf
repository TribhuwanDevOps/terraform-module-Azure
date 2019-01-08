locals {
  app_name = "${lower(replace(var.application,"/[ \\._]/","-"))}" # make name lowercase hyphen seperated
  name = "${var.environment}-${local.app_name}-appsvcplan"

  default_tags = {
    env         = "${var.environment}"
    area        = "${var.area_prefix}"
    application = "${local.app_name}"
    app_version = "${var.app_version}"
    deploy_timestamp   = "${timestamp()}"
  }
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "${local.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  tags = "${merge(local.default_tags, var.tags)}"

  kind                = "${var.kind}"
  sku {
    tier     = "${var.sku["tier"]}"
    size     = "${var.sku["size"]}"
    capacity = "${var.sku["capacity"]}"
  }
}
