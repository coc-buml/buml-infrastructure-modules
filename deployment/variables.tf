# variable "client_id" {}

# variable "client_secret" {}

# variable resource_group_name {
#   description = "name of the resource group to deploy AKS cluster in"
# }

variable location {
  description = "azure location to deploy resources"
  default     = "westeurope"
}

# variable "storage_account_name" {
#   description = "Name of the storage to create."
#   type        = string
# }


