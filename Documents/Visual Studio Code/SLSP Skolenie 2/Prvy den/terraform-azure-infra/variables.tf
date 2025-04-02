variable "resource_group_name" {
  description = "Názov resource group"
  type        = string
}

variable "location" {
  description = "Azure región pre nasadenie zdrojov"
  type        = string
  default     = "West Europe"
}

variable "environment" {
  description = "Prostredie (dev, test, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Názov projektu"
  type        = string
  default     = "terraform-azure-infra"
}

variable "address_space" {
  description = "Adresný priestor pre virtuálnu sieť"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
