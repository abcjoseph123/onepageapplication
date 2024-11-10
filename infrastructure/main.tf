variable "environment" {
  description = "Environment name (development, staging, production)"
  type        = string
  default     = "development"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}-${var.environment}"
  location = var.location
}

module "static_web_app" {
  source = "./env/${var.environment}"

  resource_group_name = azurerm_resource_group.rg.name
  environment         = var.environment
  static_web_app_name = var.static_web_app_name
}

module "mongodb" {
  source = "./env/${var.environment}"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  cosmos_account_name = var.cosmos_account_name
  environment         = var.environment
}