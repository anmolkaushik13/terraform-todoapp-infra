variable "resource_group" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "aks_cluster" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = optional(string)
    tags                = optional(map(string))
    default_node_pool = object({
      name       = optional(string)
      node_count = optional(number)
      vm_size    = optional(string)
    })
    identity = object({
      type = optional(string)
    })
  }))
}

variable "acr_registries" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    type                = string
    admin_enabled       = bool
    tags                = optional(map(string))
    georeplications = list(object({
      location                = string
      zone_redundancy_enabled = bool
      tags                    = optional(map(string))
    }))
  }))
}


variable "sql_servers" {
  description = "A map of SQL Server configurations"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login_password = optional(string)
    minimum_tls_version          = optional(string)
    administrator_login          = optional(string)
    azuread_administrator = optional(object({
      login_username = string
      object_id      = optional(string)
    }))
    tags = optional(map(string))
  }))
}

variable "sql_database" {
  description = "Configuration for the Azure SQL Database"
  type = map(object({
    name         = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
     server_name         = string
    resource_group_name = string
  }))
}


variable "mystorage" {
  type = map(object({
    name                              = string
    location                          = string
    resource_group_name               = string
    account_tier                      = string
    account_replication_type          = string
    provisioned_billing_model_version = optional(string)
    cross_tenant_replication_enabled  = optional(bool)
    access_tier                       = optional(string)
    edge_zone                         = optional(string)
    https_traffic_only_enabled        = optional(bool)
    min_tls_version                   = optional(string)
    allow_nested_items_to_be_public   = optional(bool)
    shared_access_key_enabled         = optional(bool)
    public_network_access_enabled     = optional(bool)
    default_to_oauth_authentication   = optional(bool)
    is_hns_enabled                    = optional(bool)
    nfsv3_enabled                     = optional(bool)
    large_file_share_enabled          = optional(bool)
    local_user_enabled                = optional(bool)
    queue_encryption_key_type         = optional(string)
    table_encryption_key_type         = optional(string)
    infrastructure_encryption_enabled = optional(bool)
    allowed_copy_scope                = optional(string)
    sftp_enabled                      = optional(bool)
    dns_endpoint_type                 = optional(string)
    tags                              = optional(map(string))
    network_rule = optional(object({
      default_action = string
      bypass         = optional(list(string))
      ip_rules       = optional(list(string))
    }))
  }))
}

variable "keyvault" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))
}
