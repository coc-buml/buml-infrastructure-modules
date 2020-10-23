variable "function_app_name" {
  description = "Specifies the name of the Function App. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Function App."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account where function.zip will be uploaded"
  type        = string
}

variable "storage_primary_access_key" {
  description = "Primary Access Key of the storage account where function.zip will be uploaded"
  type        = string
}


variable "linux_fx_version" {
  description = "Linux App Framework and version for the AppService PYTHON|3.8, NODE|12"
  type        = string
}

variable "functions_worker_runtime" {
  description = "Runtime of the functions e.g. python, node"
  type        = string
}
variable "insight_instrumentation_key" {
  description = "The application insight instrumentation key for the Function"
  type        = string
}



variable "app_service_plan_id" {
  description = "Id of the used service plan of the azure group"
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

variable "subnet_id" {
  description = "subnet_id of the subnet in which the satic website will be placed"
  type        = string
}

variable "static_ip" {
  description = "A list of static ip address to access the bucket"
  type        = string
}