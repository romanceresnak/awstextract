output "app_service_name" {
  value = azurerm_app_service.main.name
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.main.default_site_hostname}"
}

output "app_service_id" {
  value = azurerm_app_service.main.id
}

output "app_insights_instrumentation_key" {
  value = azurerm_application_insights.main.instrumentation_key
  sensitive = true
}