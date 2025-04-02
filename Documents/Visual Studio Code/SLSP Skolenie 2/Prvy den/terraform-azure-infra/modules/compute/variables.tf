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

variable "subnet_id" {
  description = "ID subnetu pre pripojenie VM"
  type        = string
}
