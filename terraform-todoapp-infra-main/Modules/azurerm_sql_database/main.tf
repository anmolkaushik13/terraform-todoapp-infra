resource "azurerm_mssql_database" "database" {
  for_each = var.sql_database
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.serverid[each.key].id
  collation    = each.value.collation
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  license_type = each.value.license_type
  enclave_type = each.value.enclave_type
}
