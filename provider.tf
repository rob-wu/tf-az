# Authentication
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "04fb9302-f3fc-44c3-9e1c-f323dceac012"
  tenant_id = "4a2611bd-18ba-45eb-be74-a3250474e9b1"
}
