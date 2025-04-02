variable "client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "environment" {
  description = "Prostredie (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Názov projektu"
  type        = string
  default     = "sporka"
}

variable "location" {
  description = "Azure región pre nasadenie zdrojov"
  type        = string
  default     = "West Europe"
}

variable "address_space" {
  description = "Adresný priestor pre virtuálnu sieť"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "app_service_sku" {
  description = "SKU App Service plánu"
  type        = string
  default     = "B1"
}

variable "app_service_instances" {
  description = "Počet inštancií App Service"
  type        = number
  default     = 1
}