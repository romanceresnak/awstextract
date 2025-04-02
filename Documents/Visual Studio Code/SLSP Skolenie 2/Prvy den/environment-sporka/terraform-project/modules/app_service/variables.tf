variable "resource_group_name" {
  description = "Názov resource group"
  type        = string
}

variable "location" {
  description = "Azure región pre nasadenie zdrojov"
  type        = string
}

variable "environment" {
  description = "Prostredie (dev, staging, prod)"
  type        = string
}

variable "app_service_sku" {
  description = "SKU App Service plánu (B1, S1, P1v2, atď.)"
  type        = string
  default     = "B1"
}

variable "app_service_instances" {
  description = "Počet inštancií App Service"
  type        = number
  default     = 1
}

variable "app_settings" {
  description = "Nastavenia aplikácie pre App Service"
  type        = map(string)
  default     = {}
}