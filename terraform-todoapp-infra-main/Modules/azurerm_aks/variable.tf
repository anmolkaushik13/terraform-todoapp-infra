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
