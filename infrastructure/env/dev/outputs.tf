output "static_web_app_url" {
  value = azurerm_static_site.static_web_app_dev.default_hostname
}