locals {
  app_name = "${lower(replace(var.application,"/[ \\._]/","-"))}" # make name lowercase hypen seperated
  resource_group_name = "${var.environment}-${local.app_name}"
  default_tags = {
    env         = "${var.environment}"
    area        = "${var.area_prefix}"
    application = "${local.app_name}"
    app_version = "${var.app_version}"
    deploy_timestamp   = "${timestamp()}"
  }
}

resource "azurerm_resource_group" "resource_group" {
  name = "${local.resource_group_name}"
  location = "${var.location}"
  tags = "${merge(local.default_tags, var.tags)}"
}