variable "storage_container_name" {
  description = "The name of the storage container."
  type        = string
    
}

variable "storage_account_name" {
  description = "The name of the storage account where the container will be created."
  type        = string
}

variable "container_access_type" {
  description = "values are: private, blob, or container. Determines the level of public access to the container."
}

variable "resource_group_name" {
  description = "The name of the resource group in which the storage account exists."
  type        = string  
  
}