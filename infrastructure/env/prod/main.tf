resource "azurerm_static_site" "static_web_app_prod" {
  name                = "${var.static_web_app_name}-prod"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_tier           = "Standard"  

    #logic to fetch the build application

}

resource "azurerm_app_service_plan" "app_service_plan_prod" {
  name                = "${var.app_service_plan_name}-prod"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Free"  
    size = "F1"
  }
}

resource "azurerm_app_service" "app_service_prod" {
  name                = "${var.app_service_name}-prod"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan_prod.id

 
  app_settings = {
    NODE_ENV        = "production"
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
resource "azurerm_cosmosdb_account" "mongo_prod" {
  name                = "${var.cosmos_account_name}-prod"
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

resource "azurerm_cosmosdb_mongo_database" "mongo_database_prod" {
  name                = "mydb-prod"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.mongo_prod.name
}