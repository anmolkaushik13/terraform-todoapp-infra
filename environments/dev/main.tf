locals {
  common_tags = {
    "ManagedBy"   = "Terraform"
    "Owner"       = "TodoAppTeam"
    "Environment" = "dev"
  }
}


module "rg" {
  source      = "../../modules/azurerm_resource_group"
  rg_name     = "rg-dev-todo-infra"
  rg_location = "East US"
  rg_tags     = local.common_tags
}

module "acr" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_container_registry"
  acr_name   = "acrdevtodoinfra"
  rg_name    = "rg-dev-todo-infra"
  location   = "East US"
  tags       = local.common_tags
}

module "sql_server" {
  depends_on      = [module.rg]
  source          = "../../modules/azurerm_sql_server"
  sql_server_name = "sql-dev-todo-infra"
  rg_name         = "rg-dev-todo-infra"
  location        = "East US"
  admin_username  = "devopsadmin"
  admin_password  = "P@ssw01rd@123"
  tags            = local.common_tags
}

module "sql_db" {
  depends_on  = [module.sql_server]
  source      = "../../modules/azurerm_sql_database"
  sql_db_name = "sqldb-dev-infra"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags        = local.common_tags
}

module "aks" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_kubernetes_cluster"
  aks_name   = "aks-dev-todo-infra"
  location   = "East US"
  rg_name    = "rg-dev-todo-infra"
  dns_prefix = "aks-dev-todo-infra"
  tags       = local.common_tags
}

module "aks" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_kubernetes_cluster"
  aks_name   = "aks-dev-todo-infra"
  location   = "East US"
  rg_name    = "rg-dev-todo-infra"
  dns_prefix = "aks-dev-todo-infra"
  vm_size    = "standard_b16als_v2"
  tags       = local.common_tags
}


module "pip" {
  source   = "../../modules/azurerm_public_ip"
  pip_name = "pip-dev-todo-infra"
  rg_name  = "rg-dev-todo-infra"
  location = "East US"
  sku      = "standard"
  tags     = local.common_tags
}

