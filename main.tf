provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

# Resource group
resource "azurerm_resource_group" "example" {
  name     = "example-rg-up"
  location = "West Europe"
}