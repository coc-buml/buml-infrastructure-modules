variable "apim_name" {
  description = "The name of the API Management Service. Changing this forces a new resource to be created."
  type        = string

}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the API Management Service should be exist. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "The Azure location where the API Management Service exists. Changing this forces a new resource to be created."
  type        = string
}


variable "publisher_name" {
  description = "The name of publisher/company."
  type        = string
}


variable "publisher_email" {
  description = "The email of publisher/company."
  type        = string
}


variable "api_name" {
  description = "The name of the API Management API. Changing this forces a new resource to be created."
  type        = string
}

variable "api_path" {
  description = "The Path for this API Management API, which is a relative URL which uniquely identifies this API and all of its resource paths within the API Management Service."
  type        = string
}


variable "application_insights_instrumentation_key" {
  description = "The Instrumentation key of the application insight"
  type        = string
}



variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
  # default = {
  #   environment = "dev"
  # }
}