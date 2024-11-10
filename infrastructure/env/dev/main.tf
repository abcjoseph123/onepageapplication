#Frontend
resource "azurerm_static_site" "static_web_app_dev" {
  name                = "${var.static_web_app_name}-dev"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_tier           = "Free"  

    #logic to fetch the build application

} 
#Backend
resource "azurerm_app_service_plan" "app_service_plan_dev" {
  name                = "${var.app_service_plan_name}-dev"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Free"  
    size = "F1"
  }
}

resource "azurerm_app_service" "app_service_dev" {
  name                = "${var.app_service_name}-dev"
  location            = var.location
  resource_group_name = var.resource_group_name
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

#DB
resource "azurerm_cosmosdb_account" "mongo_dev" {
  name                = "${var.cosmos_account_name}-dev"
  location            = var.location
  resource_group_name = var.resource_group_name

  offer_type          = "Standard"
  kind                = "MongoDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_mongo_database" "mongo_database_dev" {
  name                = "mydb-dev"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.mongo_dev.name
}