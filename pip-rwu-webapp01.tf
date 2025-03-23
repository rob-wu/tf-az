resource "azurerm_public_ip" "pip-rwu-webapp01" {
  name                = "pip-webapp01"
  resource_group_name = azurerm_resource_group.rg-webapp01.name
  location            = azurerm_resource_group.rg-webapp01.location
  allocation_method   = "Static"

  tags = {
    owner = "terraform"
  }
}
