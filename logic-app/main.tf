locals {
  app_name = "${lower(replace(var.application,"/[ \\._]/","-"))}" # make name lowercase hypen seperated
  name = "${var.environment}-${local.app_name}-logicapp"

  default_tags = {
    env         = "${var.environment}"
    area        = "${var.area_prefix}"
    application = "${local.app_name}"
    app_version = "${var.app_version}"
    deploy_timestamp   = "${timestamp()}"
  }
}

resource "azurerm_logic_app_workflow" "workflow" {
  name = "${local.name}"
  location = "${var.location}"
  tags = "${merge(local.default_tags, var.tags)}"
  resource_group_name = "${var.resource_group_name}"
}