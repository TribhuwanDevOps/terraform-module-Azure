variable application {
  description = "The name of the product or project this resource group represents. Used in the resource group name"
}

variable environment {
  description = "The name of the target environment for resources to be tagged with such as dev/integration/test/stage/prod"
  default     = "develop"
}

variable "location" {
  description = "The location/region where the resource group is created. Changing this forces a new resource to be created"
  default     = "North Europe" # Default to Ireland
}

variable app_version {
  description = "The SemVer version number of this deployment and build. All resources will be tagged with this under 'app_version' for easy identification."
  default     = "0.1.0.0-dev"
}

variable area_prefix {
  description = "A prefix name for the owning business area such as bbcs-appdev or bbc-digital"
  default     = "bbcs-appdev"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags which should be added to the resource group (env, area, product are already applied)"
}

variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
}

variable "app_service_plan_id" {
  # run Get-AzureRMAppServicePlan command on PS and copy id of the app service plan
  description = "The unique id of the App Service Plan on which app service will have to run"
}

variable "plan_settings" {
  type        = "map"
  description = "Definition of the dedicated plan to use"

  default = {
    kind     = "Windows" # Linux or Windows
    size     = "F1"
    capacity = 1
    tier     = "Free"
  }
}

variable "storage_primary_connection_string" {
  description = "The connection string of the backend storage account which will be used by this Function App (such as the dashboard, logs)"
}

variable "client_affinity_enabled" {
  description = "Enable client affinity a.k.a. sticky sessions"
  default     = false
}

variable "version" {
  description = "The runtime version associated with the Function App. Defaults to ~2."
  default     = "~2"
}

variable "app_settings" {
  type        = "map"
  description = "Definition of the app settings to apply"
  default     = {}
}