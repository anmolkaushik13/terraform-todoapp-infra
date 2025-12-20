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
