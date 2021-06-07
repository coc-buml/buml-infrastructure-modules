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
  default = {
  }
}

variable "read_access_object_ids" {
  description = "A list of object ids that should have read access to this keyvault"
  type        = list(string)
  default     = []
}

variable "vnet_subnets" {
  description = "The vnet subnets to register the keyvault at"
  type        = list(string)
  default     = null
}

variable "secrets" {
  description = "A map of initial secrets to apply"
  type        = map(string)
  default     = {}
  sensitive   = true
}