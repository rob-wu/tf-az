resource "azurerm_mssql_server" "sql-webapp01" {
  name                         = "sql-webapp01"
  resource_group_name          = azurerm_resource_group.rg-webapp01.name
  location                     = azurerm_resource_group.rg-webapp01.location
  version                      = "12.0"
  # secrets pulled from Azure KV
  administrator_login          = data.azurerm_key_vault_secret.sql-user.value
  administrator_login_password = data.azurerm_key_vault_secret.sql-passwd.value
  tags = {
    owner = "terraform"
  }
}