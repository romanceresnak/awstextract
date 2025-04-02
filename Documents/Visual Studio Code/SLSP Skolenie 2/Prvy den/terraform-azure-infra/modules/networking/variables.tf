variable "resource_group_name" {
  description = "Názov resource group"
  type        = string
}

variable "location" {
  description = "Azure región pre nasadenie zdrojov"
  type        = string
}

variable "environment" {
  description = "Prostredie (dev, test, prod)"
  type        = string
}

variable "address_space" {
  description = "Adresný priestor pre virtuálnu sieť"
  type        = list(string)
}