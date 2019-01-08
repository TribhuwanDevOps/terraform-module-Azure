# Azure Logic App Module

This module creates a empty logic app workflow with tagging and naming conventions. You will need to add triggers and actions.

    module.azurerm_logic_app_workflow.workflow.helloworld_logic_app_workflow
      id:                  <computed>
      access_endpoint:     "" => "<computed>"
      location:            "northeurope"
      name:                "bbcs-appdev-dev-helloworld-logicapp"
      resource_group_name: "bbcs-appdev-dev-helloworld"
      tags.%:              "3"
      tags.area:           "bbcs-appdev"
      tags.env:            "dev"
      tags.application:    "helloworld"
      tags.app_version:    "1.0.0.0"
      workflow_schema:     "https://schema.management.azure.com/providers/Microsoft.
      workflow_version:    "1.0.0.0"

## Example module use

Consume the module by referencing its location using git syntax and passing product and environment parameters:

```json
provider "azurerm" { }

variable "environment" {}

module "helloworld_logic_app_workflow" {
  source              = "git::ssh://git@bitbucket.org/bbcworldwide/terraform-modules.git//azure/modules/logic-app"
  environment         = "${var.environment}"
  application         = "helloworld"
  resource_group_name = "bbcs-appdev-dev-helloworld"
  tags = {
      some-key = "some-value"
  }
}
```

## Variables

* environment
* application
* app_version
* resource_group_name
* location
* area_prefix
* tags

See [variables.tf](variables.tf) for more info.

## Outputs

**name** The name generated for the resource, includes area, env name and product
**id** The is generated for the logic app
**access_endpoint** the logic app API url

See [outputs.tf](variables.tf) for more info.