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

variable "subnet_id" {
  description = "ID subnetu pre pripojenie VM"
  type        = string
}

variable "vm_size" {
  description = "Veľkosť virtuálneho stroja"
  type        = string
  default     = "Standard_B1s"
}