resource "azurerm_mssql_server" "server" {
  for_each                     = var.sql_servers
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator == null ? [] : [each.value.azuread_administrator]
    content {
      login_username = azuread_administrator.value.login_username
      object_id      = data.azurerm_client_config.current.object_id
    }
  }

  tags = each.value.tags
}
