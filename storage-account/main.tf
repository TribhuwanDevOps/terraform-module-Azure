locals {
  app_name = "${lower(replace(var.application,"/[ \\._]/","-"))}" # make name lowercase hyphen seperated

  storage_account_longname = "${lower("${var.environment}${replace(local.app_name,"-","")}")}"

  storage_account_name = "${substr(local.storage_account_longname,0,min(length(local.storage_account_longname),24))}"

  default_tags = {
    env         = "${var.environment}"
    area        = "${var.area_prefix}"
    application = "${local.app_name}"
    app_version = "${var.app_version}"
    deploy_timestamp   = "${timestamp()}"
  }
}

resource "azurerm_storage_account" "storage_account" {
  name                      = "${local.storage_account_name}"
  resource_group_name       = "${var.resource_group_name}"
  location                  = "${var.location}"
  account_tier              = "${var.storage_account_tier}"
  account_replication_type  = "${var.account_replication_type}"
  account_kind              = "${var.account_kind}"

  tags                      = "${merge(local.default_tags, var.tags)}"

  enable_blob_encryption    = "${var.blob_encryption}"
  enable_file_encryption    = "${var.file_encryption}"
  enable_https_traffic_only = "${var.https_traffic}"
}