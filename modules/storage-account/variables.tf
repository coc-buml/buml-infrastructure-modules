variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}



variable "storage_account_name" {
  description = "Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
  type        = string
}

variable "storage_container_name" {
  description = "Name of the storage to create."
  type        = string
}

variable "subnet_id" {
  description = "subnet_id of the subnet in which the satic website will be placed"
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