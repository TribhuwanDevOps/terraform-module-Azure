variable "resource_group_name" {
  description = "The name of the resource group to place the storage inside"
}

variable "area_prefix" {
  description = "A prefix name for the owning business area such as bbcs-appdev or bbc-digital"
  default     = "bbcs-appdev"
}

variable "environment" {
  description = "The name of the target environment for resources to be tagged with such as dev/integration/test/stage/prod"
  default     = "develop"
}

variable "application" {
  description = "The name of the product or project this resource is part of"
}

variable "location" {
  description = "The location/region where the resource group is created. Changing this forces a new resource to be created"
  default     = "North Europe" # Default to Ireland
}

variable "app_version" {
  description = "The SemVer version number of this deployment and build. All resources will be tagged with this under 'app_version' for easy identification."
  default     = "0.1.0.0-dev"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags which should be added to the resource group (env, area, application and version are already applied)"
}

variable "storage_account_tier" {
  description = "Defines the pricing tier to use for this storage account. Valid options are Standard and Premium. Changing this forces a new resource to be created"
  default = "Standard"
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are Storage, StorageV2 and BlobStorage. Changing this forces a new resource to be created"
  default = "StorageV2"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS"
  default = "RAGRS"
}

variable "blob_encryption" {
  description = "Boolean flag which controls if Encryption Services are enabled for Blob storage. Defaults to true"
  default = true
}

variable "file_encryption" {
  description = "Boolean flag which controls if Encryption Services are enabled for File storage. Defaults to true"
  default = true
}

variable "https_traffic" {
  description = "Boolean flag which forces HTTPS if enabled"
  default = true
}