resource "azurerm_app_service_plan" "main" {
  name                = "${var.environment}-app-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  
  sku {
    tier = substr(var.app_service_sku, 0, 1) == "B" ? "Basic" : substr(var.app_service_sku, 0, 1) == "S" ? "Standard" : substr(var.app_service_sku, 0, 1) == "P" ? "Premium" : "Free"
    size = var.app_service_sku
  }
  
  tags = {
    Environment = var.environment
  }
}

resource "azurerm_app_service" "main" {
  name                = "${var.environment}-sporka-app"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.main.id
  
  site_config {
    dotnet_framework_version = "v4.0"
    always_on                = var.app_service_sku != "F1" && var.app_service_sku != "D1" ? true : false
    min_tls_version          = "1.2"
  }
  
  app_settings = merge({
    "WEBSITE_NODE_DEFAULT_VERSION" = "~14"
    "ENVIRONMENT"                  = var.environment
  }, var.app_settings)
  
  tags = {
    Environment = var.environment
  }
}

resource "azurerm_application_insights" "main" {
  name                = "${var.environment}-sporka-insights"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  
  tags = {
    Environment = var.environment
  }
}