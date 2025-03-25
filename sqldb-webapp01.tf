resource "azurerm_mssql_database" "sqldb-webapp01" {
  name        = "sqldb-webapp01"
  server_id   = azurerm_mssql_server.sql-webapp01.id
  max_size_gb = 2
  sku_name    = "Basic"
  long_term_retention_policy {
    weekly_retention = "P1M"
  }

  tags = {
    owner = "terraform"
  }

  # prevent the possibility of accidental data loss
  #lifecycle {
  #  prevent_destroy = true
  #}


  depends_on = [azurerm_mssql_server.sql-webapp01]
}