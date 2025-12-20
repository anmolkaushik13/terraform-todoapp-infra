resource_group = {
  "rg-dev1" = {
    name       = "rg-dev222"
    location   = "East US"
    managed_by = "dev-admin"
  }
  "rg-test" = {
    name       = "rg-test"
    location   = "West US"
    managed_by = "test-admin"
  }
}

mystorage = {

  stg1 = {
    name                     = "jiocloudstg342"
    location                 = "east us"
    resource_group_name      = "rg-dev222"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    network_rule = {
      default_action = "Deny"
      bypass         = ["AzureServices"]
      ip_rules       = ["122.181.100.122"]
    }
  }

  stg2 = {
    name                     = "jiocloudstg234"
    location                 = "east us"
    resource_group_name      = "rg-dev222"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    # network_rule = {
    #   default_action = "Deny"
    #   bypass         = ["AzureServices"]
    #   ip_rules       = ["122.181.100.122"]
    # }
  }
}


aks_cluster = {
  "aks-dev" = {

    name                = "aks-dev165"
    location            = "East US"
    resource_group_name = "rg-dev222"
    dns_prefix          = "aksdev165"
    default_node_pool = {
      name       = "agentpool43"
      node_count = 2
      vm_size    = "Standard_D2_v2"
    }
    identity = {
      type = "SystemAssigned"
    }
  }
}

acr_registries = {
  "acr1" = {
    name                = "containerRegistry1433"
    location            = "eastus"
    resource_group_name = "rg-dev222"
    sku                 = "Premium"
    type                = "UserAssigned"
    admin_enabled       = true
    georeplications = [
      {
        location                = "eastus2"
        zone_redundancy_enabled = true

      },
      {
        location                = "westus"
        zone_redundancy_enabled = false

      }
    ]
  }
}

sql_servers = {
  server1 = {
    server_name                  = "server1"
    name                         = "sqlserverdev01"
    resource_group_name          = "rg-dev222"
    location                     =  "eastus2" 
    version                      = "12.0"
    administrator_login          = "sqladminuser"
    administrator_login_password = "P@ssw0rd1234!"
    minimum_tls_version          = "1.2"
    azuread_administrator = {
      login_username = "sqladminuser"
    }
  }
}



sql_database = {
  "db1" = {
    name         = "sqldb-dev-01"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
     server_name         = "sqlserverdev01"
    resource_group_name = "rg-dev222"
  }
}


keyvault = {
  kv1 = {
    name                        = "myddkv1"
    location                    = "east us"
    resource_group_name         = "rg-dev222"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
  }

}
