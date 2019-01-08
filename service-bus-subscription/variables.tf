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

variable "app_version" {
  description = "The SemVer version number of this deployment and build. All resources will be tagged with this under 'app_version' for easy identification."
  default     = "0.1.0.0-dev"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags which should be added to the resource group (env, area, application and version are already applied)"
}

variable "servicebus_namespace_name" {
  description = "Service Bus Namespace name for which Subscription will be created"
}

variable "servicebus_topic_name" {
  description = "Service Bus Topic name for which Subscription will be created"
}

variable "subscription_name" {
  description = "Name for the subscription"
}

variable "max_delivery_count" {
  default = "1"
  description = "The maximum number of deliveries"
}

variable "listen_policy" {
  description = "Grants listen access to this this Authorization Rule"
  default = true
}

variable "send_policy" {
  description = "Grants send access to this this Authorization Rule"
  default = false
}

variable "manage_policy" {
  description = "Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be true."
  default = false
}
