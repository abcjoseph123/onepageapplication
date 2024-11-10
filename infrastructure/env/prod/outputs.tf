output "static_web_app_url" {
  value = azurerm_static_site.static_web_app_prod.default_hostname
}