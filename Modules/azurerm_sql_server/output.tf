output "sql_server_id" {
  description = "ID of the created Azure SQL Server"
  value       = { for k, v in azurerm_mssql_server.server : k => v.id }
}