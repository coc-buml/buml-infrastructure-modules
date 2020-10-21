variable "resource_group_name" {
  description = "Name of the azure resource group"
  type        = string
}

variable "location" {
  description = "location of the service"
  type        = string
}

variable "subnet_id" {
  description = "subnet_id of the subnet in which the satic website will be placed"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage to create."
  type        = string
}

variable "static_ip" {
  description = "A list of static ip address to access the bucket"
  type        = list(string)
}


variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
  # default = {
  #   environment = "dev"
  # }
}