variable "audit_name" {
  description = "name to give the diagnostic audits"
    type        = string

}

variable "target_resource_id" {
  description = "id of the target resource"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "the id of the log analytics workspace"
  type        = string
}

# variable "tags" {
#   description = "The tags to associate with your network and subnets."
#   type        = map(string)
#   # default = {
#   #   environment = "dev"
#   # }
# }