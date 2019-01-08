locals {
  app_name = "${lower(replace(var.application,"/[ \\._]/","-"))}" # make name lowercase hyphen seperated
  name = "${var.environment}-${local.app_name}-appsvc"


  default_tags = {
    env         = "${var.environment}"
    area        = "${var.area_prefix}"
    application = "${local.app_name}"
    app_version = "${var.app_version}"
    deploy_timestamp   = "${timestamp()}"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "${local.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  app_service_plan_id = "${var.app_service_plan_id}"
  tags = "${merge(local.default_tags, var.tags)}"
  client_affinity_enabled = "${var.client_affinity_enabled}"
  
  site_config         = {
    always_on       = true
    dotnet_framework_version = "v4.0"
    ftps_state      = "Disabled"
    min_tls_version = "1.2"
    default_documents = [
      "Default.htm",
      "Default.html",
      "Default.asp",
      "index.htm",
      "index.html",
      "iisstart.htm",
      "default.aspx",
      "index.php",
      "hostingstart.html",
    ]
  }

  app_settings        = "${var.app_settings}"
}