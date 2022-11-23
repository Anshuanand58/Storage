module "storage" {
  source               = "C:/Terraform/storage_account/test"
  resource_group_name  = var.resource_group_name
  instance_index       = 1
  storage_account_name = var.storage_account_name
  container = [{ name : "blobcontainer", container_access_type = "blob" },
    { name : "blobconttestainer", container_access_type = "private" }
  ]
  skuname                      = var.skuname
  resource_group_location      = var.resource_group_location
  access_tier                  = var.access_tier
  account_replication_type     = var.account_replication_type
  account_kind                 = var.account_kind
  shared_access_key_enabled    = var.shared_access_key_enabled
  static_website               = null
  enable_https_traffic_only    = var.enable_https_traffic_only
  identity_type                = null
  public_ip                    = var.public_ip
  allocation_method            = var.allocation_method
  lb_name                      = var.lb_name
  azurerm_private_link_service = var.azurerm_private_link_service
  private_endpoint             = var.private_endpoint
  subnet_name1                 = var.subnet_name1
  pvt_dns_zone_name            = var.pvt_dns_zone_name
  pvt_dns_zone_name_link       = var.pvt_dns_zone_name_link
  vnet_name                    = var.vnet_name
  subnet_name                  = var.subnet_name
  private_service_connection   = var.private_service_connection
}
