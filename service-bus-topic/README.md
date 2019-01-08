# Azure Service Bus Topic Module

This module creates a service bus namespace and topic with tagging & naming conventions and authorization rules for the topic. Used for sending messages in a pub-sub configuration.
    
      + module.service_bus_topic.azurerm_servicebus_namespace.servicebus_namespace
          id:                                      <computed>
          default_primary_connection_string:       <computed>
          default_primary_key:                     <computed>
          default_secondary_connection_string:     <computed>
          default_secondary_key:                   <computed>
          location:                                "northeurope"
          name:                                    "bbcs-appdev-dev-servicebus-topic-servicebus"
          resource_group_name:                     "bbcs-appdev-dev-servicebus-topic"
          sku:                                     "Standard"
          tags.%:                                  "4"
          tags.app_version:                        "1.0.1"
          tags.application:                        "servicebus-topic"
          tags.area:                               "bbcs-appdev"
          tags.env:                                "dev"
    
      + module.service_bus_topic.azurerm_servicebus_topic.servicebus_topic
          id:                                      <computed>
          auto_delete_on_idle:                     <computed>
          default_message_ttl:                     <computed>
          duplicate_detection_history_time_window: <computed>
          enable_partitioning:                     "true"
          max_size_in_megabytes:                   <computed>
          name:                                    "bbcs-appdev-dev-servicebus-topic-servicebustopic"
          namespace_name:                          "bbcs-appdev-dev-servicebus-topic-servicebus"
          resource_group_name:                     "bbcs-appdev-dev-servicebus-topic"
          status:                                  "Active"
    
      + module.service_bus_topic.azurerm_servicebus_topic_authorization_rule.auth_rule
          id:                                      <computed>
          listen:                                  "false"
          manage:                                  "false"
          name:                                    "bbcs-appdev-dev-servicebus-topic-servicebustopic-auth"
          namespace_name:                          "bbcs-appdev-dev-servicebus-topic-servicebus"
          primary_connection_string:               <computed>
          primary_key:                             <computed>
          resource_group_name:                     "bbcs-appdev-dev-servicebus-topic"
          secondary_connection_string:             <computed>
          secondary_key:                           <computed>
          send:                                    "true"
          topic_name:                              "bbcs-appdev-dev-servicebus-topic-servicebustopic"
    
    
    Plan: 3 to add, 0 to change, 0 to destroy.
    
    ------------------------------------------------------------------------

## Example module use

Consume the module by referencing its location using git syntax and passing product and environment parameters:

```json
variable environment {}
variable application {}
variable app_version {}

provider azurerm { }

module "resource_group" {
  source = "git::ssh://git@bitbucket.org/bbcworldwide/terraform-modules.git//azure/modules/resource-group"
  environment = "${var.environment}"
  application = "${var.application}"
  app_version = "${var.app_version}"
}

module "service_bus_topic" {
  source = "git::ssh://git@bitbucket.org/bbcworldwide/terraform-modules.git//azure/modules/service-bus-topic"
  environment = "${var.environment}"
  application = "${var.application}"
  resource_group_name = "${module.resource_group.name}"
  app_version = "${var.app_version}"
  topic_name = "my-topic-name"
}
```

## Variables

* environment
* app_version
* application
* topic_name

See [variables.tf](variables.tf) for more info.

## Outputs

**name** The name generated the service bus topic name
**id** The is generated for the service bus topic
**topic_primary_key** This will be generated to authorize service bus topic
**topic_primary_connection_string** This connection string will be generated to authrize service bus topic
**servicebus_namespace_name** the generate name of the namespace created for the topic deployed

See [outputs.tf](output.tf) for more info.