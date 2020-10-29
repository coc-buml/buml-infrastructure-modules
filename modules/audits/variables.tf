variable "target_resource_id" {
  description = "The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created."
  type        = string

}

variable "diagnostic_name" {
  description = " Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created."
  type        = string

}

variable "log_analytics_workspace_id" {
  description = "Specifies the ID of a Log Analytics Workspace where Diagnostics Data should be sent. Changing this forces a new resource to be created."
  type        = string
}

variable "log" {
  description = "One or more log blocks as defined below."
  type        = map(string)
  # default = {
  #   environment = "dev"
  # }
}

variable "metric" {
  description = "One or more metric blocks as defined below."
  type        = map(string)
  # default = {
  #   environment = "dev"
  # }
}


