# Azure Resource Group Module

This module creates a resource group that follows naming and tagging conventions:

    module.resource_group.azurerm_resource_group.helloworld_resource_group
      id:           <computed>
      location:         "northeurope"
      name:             "bbcs-appdev-dev-helloworld"
      tags.%:           "3"
      tags.area:        "bbcs-appdev"
      tags.env:         "dev"
      tags.application: "helloworld"
      tags.app_version: "1.0.0.0"
## Example module use

Consume the module by referencing its location using git syntax and passing product and environment parameters:

```json
provider "azurerm" { }

variable "environment" {}

module "helloworld_resource_group" {
  source      = "git::ssh://git@bitbucket.org/bbcworldwide/terraform-modules.git//azure/modules/resource-group"
  environment = "${var.environment}"
  application = "helloworld"
  tags        = {
      some-key = "some-value"
  }
}
```

## Variables

* environment
* application
* app_version
* location
* area_prefix
* tags

See [variables.tf](variables.tf) for more info.

## Outputs

**resource_group_name** The name generated for the resource, includes area, env name and product
**id** The unique ID of the created group

See [outputs.tf](variables.tf) for more info.