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

variable "application_type" {
  description = "Specifies the type of Application Insights to create. Valid values are Java, iOS, MobileCenter, Other, Phone, Store and Web"
  default     = "Web"
}