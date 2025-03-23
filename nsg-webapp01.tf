resource "azurerm_network_security_group" "nsg-webapp01" {
  name                = "nsg-webapp01"
  location            = azurerm_resource_group.rg-webapp01.location
  resource_group_name = azurerm_resource_group.rg-webapp01.name

  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Allow-App-Gateway-Ports"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["65200-65535"] # Application Gateway backend ports
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  tags = {
    owner = "terraform"
  }
}