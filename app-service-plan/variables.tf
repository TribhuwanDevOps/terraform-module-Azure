variable application {
  description = "The name of the product or project this resource is part of"
}

variable app_version {
  description = "The SemVer version number of this deployment and build. All resources will be tagged with this under 'app_version' for easy identification."
  default     = "0.1.0.0-dev"
}

variable resource_group_name {
  description = "The name of the resource group to place the app service plan inside"
}

variable area_prefix {
  description = "A prefix name for the owning business area such as bbcs-appdev or bbc-digital"
  default     = "bbcs-appdev"
}

variable environment {
  description = "The name of the target environment for resources to be tagged with such as dev/integration/test/stage/prod"
  default     = "develop"
}

variable "location" {
  description = "The location/region where the resource group is created. Changing this forces a new resource to be created"
  default     = "North Europe" # Default to Ireland
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags which should be added to the resource group (env, area, product are already applied)"
}

variable "kind" {
  description = "OS of app service environnment. Choose 'Linux' or 'Windows' or 'FunctionApp' (if for Functions on Consumption Plan)"
  default     = "Windows"
}

variable "sku" {
  type        = "map"
  description = "Definition of the dedicated plan to use. Defaults to a free tier. Size F1 and Tier Free are zero cost. Use B1 and Basic or better for always_on support."

  default = {
    size     = "B1"
    capacity = 1
    tier     = "Basic"
  }
}