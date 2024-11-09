variable "environment" {
  description = "Environment name (development, staging, production)"
  type        = string
  default     = "development"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name_frontend}-${var.environment}"
  location = var.location
}

module "static_web_app" {
  source = "./env/${var.environment}"

  resource_group_name = azurerm_resource_group.rg.name
  environment         = var.environment
  static_web_app_name = var.static_web_app_name
}
