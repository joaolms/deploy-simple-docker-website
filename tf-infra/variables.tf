variable "location" {
  description = "Region"
  type        = string
  default     = "brazilsouth"
}

variable "webapp_resource_group" {
  description = "Resource Group"
  type        = string
  default     = "WEBAPP-ATL"
}

variable "terraform_organization" {
  description = "Orzanização que será usada no Terraform Cloud"
  type = string
  default = "orgjoaolms"
}

variable "terraform_workspace" {
  description = "Workspace dentro da organização do Terraform Cloud"
  type = string
  default = "deploy-simple-docker-website"
}
