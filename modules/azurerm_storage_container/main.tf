resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container_name
  storage_account_id    = data.azurerm_storage_account.storage_account.id
  container_access_type = var.container_access_type
}