data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}
resource "azurerm_storage_account" "storage" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.resource_group_location
  account_tier              = var.access_tier
  account_replication_type  = var.account_replication_type
  account_kind              = var.account_kind
  shared_access_key_enabled = var.shared_access_key_enabled
  large_file_share_enabled  = var.account_kind != "BlockBlobStorage"
  enable_https_traffic_only = var.enable_https_traffic_only

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : ["enabled"]
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids == "UserAssigned" ? var.identity_ids : null
    }
  }
  dynamic "static_website" {
    for_each = var.static_website == null ? [] : ["enabled"]
    content {
      index_document     = var.static_website.index_document
      error_404_document = var.static_website.error_404_document
    }
  }
  depends_on = [
    data.azurerm_resource_group.example
  ]
}
resource "azurerm_storage_container" "container" {
  for_each = try({ for c in var.container : c.name => c }, {})
  storage_account_name = azurerm_storage_account.storage.name
  name                  = each.key
  container_access_type = coalesce(each.value.container_access_type, "blob")
}

resource "azurerm_storage_management_policy" "lcpolicy" {
  count              = length(var.lifecycles) == 0 ? 0 : 1
  storage_account_id = azurerm_storage_account.storage.id

  dynamic "rule" {
    for_each = var.lifecycles
    iterator = rule
    content {
      name    = "rule${rule.key}"
      enabled = true
      filters {
        prefix_match = rule.value.prefix_match
        blob_types   = ["blockBlob"]
      }
      actions {
        base_blob {
          tier_to_cool_after_days_since_modification_greater_than    = rule.value.tier_to_cool_after_days
          tier_to_archive_after_days_since_modification_greater_than = rule.value.tier_to_archive_after_days
          delete_after_days_since_modification_greater_than          = rule.value.delete_after_days
        }
        snapshot {
          delete_after_days_since_creation_greater_than = rule.value.snapshot_delete_after_days
        }
      }
    }
  }
}

