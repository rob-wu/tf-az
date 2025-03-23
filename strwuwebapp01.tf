# Azure Storage Account
resource "azurerm_storage_account" "strwuwebapp01" {
  name                     = "strwuwebapp01"
  resource_group_name      = azurerm_resource_group.rg-webapp01.name
  location                 = azurerm_resource_group.rg-webapp01.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    owner = "terraform"
  }
}
