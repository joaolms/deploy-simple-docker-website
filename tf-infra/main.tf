terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.74.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_webapp" {
  name     = var.webapp_resource_group
  location = var.location
}

resource "azurerm_app_service_plan" "asp_webapp_dev" {
  name                = "asp-webapp-dev"
  location            = azurerm_resource_group.rg_webapp.location
  resource_group_name = azurerm_resource_group.rg_webapp.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "webapp_dev_atl_09876" {
  name                = "webapp-dev-atl-09876"
  location            = azurerm_resource_group.rg_webapp.location
  resource_group_name = azurerm_resource_group.rg_webapp.name
  app_service_plan_id = azurerm_app_service_plan.asp_webapp_dev.id

  site_config {
    linux_fx_version = "DOCKER|joaolms/tests:latest"
    always_on        = "false"
    app_command_line = ""
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = "https://index.docker.io"
  }

}
