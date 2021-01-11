variable "key_vault_name" {
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the azure resource group"
  type        = string
}

variable "location" {
  description = "location of the service"
  type        = string
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
  # default = {
  #   environment = "dev"
  # }
}
