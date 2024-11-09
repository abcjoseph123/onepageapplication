# env/development/main.tf
resource "azurerm_app_service_plan" "app_service_plan_dev" {
  name                = "${var.app_service_plan_name}-dev"
  location            = var.location
  resource_group_name = var.resource_group_name_backend
  sku {
    tier = "Free"  # Use a lower tier for dev, and higher for staging/prod
    size = "F1"
  }
}

resource "azurerm_app_service" "app_service_dev" {
  name                = "${var.app_service_name}-dev"
  location            = var.location
  resource_group_name = var.resource_group_name_backend
  app_service_plan_id = azurerm_app_service_plan.app_service_plan_dev.id

 
  app_settings = {
    NODE_ENV        = "development"
    WEBSITE_NODE_DEFAULT_VERSION ="16-LTS"
    WEBSITE_RUN_FROM_PACKAGE = "1"  
  }

  connection_string {
    name  = "Database"
    type  = "MongoDB"
    value = "entervaluehere"
  }
}