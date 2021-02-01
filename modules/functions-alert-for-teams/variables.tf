variable "name" {
  description = "name to give to alert + logic app"
}

variable "resource_group_name" {
  description = "Name of the azure resource group"
  type        = string
}

variable "resources_to_monitor_ids" {
  description = "ids of the azure functions to monitor"
  type        = list(string)
}

variable "location" {
  description = "location of the service"
  type        = string
}

# variable "tags" {
#   description = "The tags to associate with your network and subnets."
#   type        = map(string)
#   # default = {
#   #   environment = "dev"
#   # }
# }