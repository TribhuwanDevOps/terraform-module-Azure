# Azure Service Bus Queue Module

This module creates a Service Bus Queue module with tagging and naming conventions.
    
      + module.service_bus_queue.azurerm_servicebus_namespace.servicebus_namespace
          id:                                      <computed>
          default_primary_connection_string:       <computed>
          default_primary_key:                     <computed>
          default_secondary_connection_string:     <computed>
          default_secondary_key:                   <computed>
          location:                                "northeurope"
          name:                                    "bbcs-appdev-dev-my-first-queue-servicebus"
          resource_group_name:                     "bbcs-appdev-dev-my-first-queue"
          sku:                                     "Standard"
          tags.%:                                  "4"
          tags.app_version:                        "1.0.1"
          tags.application:                        "my-first-queue"
          tags.area:                               "bbcs-appdev"
          tags.env:                                "dev"
    
      + module.service_bus_queue.azurerm_servicebus_queue.servicebus_queue
          id:                                      <computed>
          auto_delete_on_idle:                     <computed>
          dead_lettering_on_message_expiration:    "false"
          default_message_ttl:                     <computed>
          duplicate_detection_history_time_window: <computed>
          enable_express:                          "false"
          enable_partitioning:                     "true"
          lock_duration:                           <computed>
          max_size_in_megabytes:                   <computed>
          name:                                    "my-first-queue-queue"
          namespace_name:                          "bbcs-appdev-dev-my-first-queue-servicebus"
          requires_duplicate_detection:            "false"
          requires_session:                        "false"
          resource_group_name:                     "bbcs-appdev-dev-my-first-queue"
    
      + module.service_bus_queue.azurerm_servicebus_queue_authorization_rule.queue_authrule
          id:                                      <computed>
          listen:                                  "false"
          manage:                                  "false"
          name:                                    "my-first-queue-queue-authrule"
          namespace_name:                          "bbcs-appdev-dev-my-first-queue-servicebus"
          primary_connection_string:               <computed>
          primary_key:                             <computed>
          queue_name:                              "my-first-queue-queue"
          resource_group_name:                     "bbcs-appdev-dev-my-first-queue"
          secondary_connection_string:             <computed>
          secondary_key:                           <computed>
          send:                                    "true"
    
    
    Plan: 3 to add, 0 to change, 0 to destroy.
    
    ------------------------------------------------------------------------

## Example module use

Consume the module by referencing its location using git syntax and passing product and environment parameters:

```json
provider azurerm { }


module "resource_group" {
  source = "git::ssh://git@bitbucket.org/bbcworldwide/terraform-modules.git//azure/modules/resource-group"
  environment = "${var.environment}"
  application = "${var.application}"
  app_version = "${var.app_version}"
}


module "service_bus_queue" {
  source = "git::ssh://git@bitbucket.org/bbcworldwide/terraform-modules.git//azure/modules/service-bus-queue"
  environment = "${var.environment}"
  application = "${var.application}"
  resource_group_name = "${module.resource_group.name}"
  app_version = "${var.app_version}"
}
```

## Variables

* environment
* application
* app_version
* location
* sku
* listen_policy
* send_policy

See [variables.tf](variables.tf) for more info.

## Outputs

**name** The name generated for the service bus queue
**id** The is generated for the service bus queue


See [outputs.tf](outputs.tf) for more info.