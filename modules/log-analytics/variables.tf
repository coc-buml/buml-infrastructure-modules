variable "log_analytics_name" {
  description = "name to give the log analytics workspace"
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