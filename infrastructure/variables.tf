variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
  default     = "static-web-app-rg"
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "westeurope"
}

variable "environment" {
  description = "Environment type (development, staging, production)"
  type        = string
}

variable "static_web_app_name" {
  description = "Name of static web app"
  type        = string
}