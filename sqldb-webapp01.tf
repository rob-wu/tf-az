resource "azurerm_mssql_database" "sqldb-webapp01" {
  name        = "sqldb-webapp01"
  server_id   = azurerm_mssql_server.sql-webapp01.id
  max_size_gb = 2
  sku_name    = "Basic"

  tags = {
    owner = "terraform"
  }

  # prevent the possibility of accidental data loss
  #lifecycle {
  #  prevent_destroy = true
  #}


  depends_on = [azurerm_mssql_server.sql-webapp01]
}