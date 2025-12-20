variable "acr_registries" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    type                = string
    admin_enabled       = bool
    georeplications = list(object({
      location                = string
      zone_redundancy_enabled = bool
      tags                    = map(string)
    }))
  }))
}
