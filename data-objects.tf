data "azurerm_subnet" "webapp01-default" {
  name                 = "webapp01-default"
  virtual_network_name = "vnet-webapp01"
  resource_group_name  = "rg-webapp01"

  depends_on = [azurerm_virtual_network.vnet-webapp01]
}

data "azurerm_key_vault" "kv-rwu" {
  name                = "kv-rwu"
  resource_group_name = "rg-keyvaults"
}

data "azurerm_key_vault_secret" "sql-user" {
  name         = "SQL-USER"
  key_vault_id = data.azurerm_key_vault.kv-rwu.id
}

data "azurerm_key_vault_secret" "sql-passwd" {
  name         = "SQL-PASSWD"
  key_vault_id = data.azurerm_key_vault.kv-rwu.id
}