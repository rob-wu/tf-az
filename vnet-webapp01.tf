# webapp virtual network
resource "azurerm_virtual_network" "vnet-webapp01" {
  name                = "vnet-webapp01"
  location            = azurerm_resource_group.rg-webapp01.location
  resource_group_name = azurerm_resource_group.rg-webapp01.name
  address_space       = ["10.10.0.0/24"]
  dns_servers         = ["1.1.1.1", "1.0.0.1"]

  subnet {
    name                            = "webapp01-default"
    address_prefixes                = ["10.10.0.0/24"]
    security_group                  = azurerm_network_security_group.nsg-webapp01.id
    default_outbound_access_enabled = false
  }

  tags = {
    owner = "terraform"
    depends_on = [azurerm_resource_group.rg-webapp01]

}