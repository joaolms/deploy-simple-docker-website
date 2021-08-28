variable "location" {
  description = "Region"
  type        = string
  default     = "eastus"
}

variable "webapp_resource_group" {
  description = "Resource Group"
  type        = string
  default     = "WebApp-RG"
}

variable "webapp_name" {
  description = "Nome do Azure WebApp"
  type        = string
  default     = "webapp-atl-09876"
}

variable "webapp_health_check_path" {
  description = "Path para monitoramento via health check"
  type        = string
  default     = "/"
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
