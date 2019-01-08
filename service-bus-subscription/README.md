# Azure Service Bus Subscription Module

This module creates a service bus subscription with provided namespace and service bus topic. This module also creates 
Service Bus Topic authorization rule to manage subscriptions.

           + module.service_bus_subscription.azurerm_servicebus_subscription.azure_servicebus_subscription
                id:                          <computed>
                auto_delete_on_idle:         <computed>
                default_message_ttl:         <computed>
                lock_duration:               <computed>
                max_delivery_count:          "1"
                name:                        "my-servicebus-subscription"
                namespace_name:              "my-bbcs-namespace"
                resource_group_name:         "demo-namespace"
                topic_name:                  "my-servicebus-topic"
          
            + module.service_bus_subscription.azurerm_servicebus_topic_authorization_rule.auth_rule
                id:                          <computed>
                listen:                      "true"
                manage:                      "false"
                name:                        "my-servicebus-topic-auth"
                namespace_name:              "my-bbcs-namespace"
                primary_connection_string:   <computed>
                primary_key:                 <computed>
                resource_group_name:         "demo-namespace"
                secondary_connection_string: <computed>
                secondary_key:               <computed>
                send:                        "false"
                topic_name:                  "my-servicebus-topic"
          
          
          Plan: 2 to add, 0 to change, 0 to destroy.
          
          ------------------------------------------------------------------------                             

## Example module use

Consume the module by referencing its location using git syntax and passing product and environment parameters:

```json
module "service_bus_subscription" {
  source = "git::ssh://git@bitbucket.org/bbcworldwide/terraform-modules.git//azure/modules/service-bus-subscription"
  environment = "${var.environment}"
  application = "${var.application}"
  app_version = "${var.app_version}"
  resource_group_name = "${var.resource_group_name}"
  servicebus_namespace_name = "${var.servicebus_namespace_name}"
  servicebus_topic_name = "${var.servicebus_topic_name}"
}
```

## Variables

* environment
* application
* resource_group_name
* servicebus_namespace_name
* servicebus_topic_name


See [variables.tf](variables.tf) for more info.

## Outputs

**name** The name generated for the resource, includes area, env name and product
**id** The is generated for the logic app
**topic_primary_key** This will be generated to authrize service bus topic
**topic_primary_connection_string** This connection string will be generated to authrize service bus topic

See [outputs.tf](outputs.tf) for more info.