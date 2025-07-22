variable "storage_account_name" {
  description = "The name of the storage account. Must be between 3 and 24 characters in length and use numbers and lower-case letters only."
  type        = string  
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which the storage account will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the storage account will be created."
  type        = string
}

variable "account_tier" {
  description = "The performance tier of the storage account. Possible values are 'Standard' and 'Premium'."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type for the storage account. Possible values include 'LRS', 'GRS', 'RAGRS', 'ZRS', 'GZRS', and 'RAGZRS'."
  type        = string
  default     = "LRS"
}
