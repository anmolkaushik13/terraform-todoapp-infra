module "resource_group" {
  source         = "../../Modules/azurerm_resource_group"
  resource_group = var.resource_group
}

module "storage_account" {
  source    = "../../Modules/azurerm_storage_account"
  mystorage = var.mystorage
}

module "aks_cluster" {
  source      = "../../Modules/azurerm_aks"
  aks_cluster = var.aks_cluster

}

module "acr_registries" {
  depends_on     = [module.resource_group]
  source         = "../../Modules/azurerm_acr"
  acr_registries = var.acr_registries

}

module "mssql_servers" {
  depends_on  = [var.resource_group]
  source      = "../../Modules/azurerm_sql_server"
  sql_servers = var.sql_servers
}

module "msssql_databases" {
  depends_on   = [module.resource_group, module.mssql_servers]
  source       = "../../Modules/azurerm_sql_database"
  sql_database = var.sql_database
}

module "keyvault" {
  depends_on = [module.resource_group]
  source     = "../../Modules/azurerm_keyvault"
  keyvault   = var.keyvault

}
