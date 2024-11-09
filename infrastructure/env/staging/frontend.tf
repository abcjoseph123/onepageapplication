resource "azurerm_static_site" "static_web_app_staging" {
  name                = "${var.static_web_app_name}-staging"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_tier           = "Standard"  
}