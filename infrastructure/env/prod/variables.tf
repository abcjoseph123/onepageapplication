variable "resource_group_name_frontend" {
  description = "Resource Group name for frontend"
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

variable "cosmos_account_name" {
  description = "Base name for the Cosmos DB account"
  type        = string
}

variable "resource_group_name_db" {
  description = "Resource Group name for database"
  type        = string
  default     = "mongodb-rg"
}

variable "resource_group_name_backend" {
  description = "Resource Group name for backend"
  type        = string
  default     = "nodejs-app-rg"
}

variable "app_service_plan_name" {
  description = "Base name for the App Service Plan"
  type        = string
}

variable "app_service_name" {
  description = "Base name for the App Service"
  type        = string
}