variable "resource_group_name" {
  description = "The name of the resource group to place the service bus into"
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
  description = "The name of the product or project this resource group represents. Used in the resource group name"
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

variable "sku" {
  default = "Standard"
  description = "Tier name"
}

variable "partitioning" {
  default = true
  description = "Boolean flag which controls whether to enable the topic to be partitioned across multiple message brokers"
}

variable "listen_policy" {
  description = "Grants listen access to this this Authorization Rule"
  default = false
}

variable "send_policy" {
  description = "Grants send access to this this Authorization Rule"
  default = true
}

variable "manage_policy" {
  description = "Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be true."
  default = false
}

variable "topic_name" {
  description = "The name of the deployed topic."
}
