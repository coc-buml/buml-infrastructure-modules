# variable "client_id" {}

# variable "client_secret" {}

variable resource_group_name {
  description = "name of the resource group to deploy AKS cluster in"
}

variable location {
  description = "azure location to deploy resources"
  default     = "westeurope"
}




