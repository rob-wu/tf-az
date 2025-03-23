# Define the resource group
resource "azurerm_resource_group" "rg-webapp01" {
  name     = "rg-webapp01"
  location = "East US 2"

  tags = {
    owner = "terraform"
  }
}
