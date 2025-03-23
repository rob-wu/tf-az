terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstates"
    storage_account_name = "robertwutfstates"
    container_name       = "azurerm-tfstate"
    key                  = "azurerm-tfstate.tfstate"
  }
}
