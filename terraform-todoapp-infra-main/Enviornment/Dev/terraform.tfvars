resource_group = {
  "rg-dev1" = {
    name       = "rg-dev-micro"
    location   = "East US"
    managed_by = "Terraform"
  }
}

mystorage = {
  stg1 = {
    name                     = "stddevmicro"
    location                 = "East US"
    resource_group_name      = "rg-dev-micro"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    network_rule = {
      default_action = "Deny"
      bypass         = ["AzureServices"]
      ip_rules       = ["122.181.100.122"]
    }
  }
}


aks_cluster = {
  "aks-dev" = {
    name                = "aks-dev-micro"
    location            = "East US"
    resource_group_name = "rg-dev-micro"
    dns_prefix          = "aksdevmicro"
    default_node_pool = {
      name       = "agentpool43"
      node_count = 2
      vm_size    = "Standard_DC2s_v3"
    }
    identity = {
      type = "SystemAssigned"
    }
  }
}

acr_registries = {
  "acr1" = {
    name                = "acrdevmicro"
    location            = "eastus"
    resource_group_name = "rg-dev-micro"
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
    name                         = "serverdevmicroservice122111-ci"
    resource_group_name          = "rg-dev-micro"
    location                     = "centralindia"     # changed from eastus2
    version                      = "12.0"
    administrator_login          = "sqladminuser"
    administrator_login_password = "P@ssw0rd1234!"
    minimum_tls_version          = "1.2"
    azuread_administrator = {
      login_username = "ssaadadmin"   # must be different from sqladminuser
    }
  }
}



sql_database = {
  "db1" = {
    name                = "database-dev-micro"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
    server_name         = "serverdevmicroservice122111-ci"
    resource_group_name = "rg-dev-micro"
  }
}


keyvault = {
  kv1 = {
    name                        = "keyvaultmicro"
    location                    = "east us"
    resource_group_name         = "rg-dev-micro"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
  }
}
