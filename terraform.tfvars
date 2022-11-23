 resource_group_name           = "storage-RG"
  instance_index               = 1
   storage_account_name        = "anshustorage1999"
   container                   = [{name:"blobcontainer",container_access_type = "blob"}, { name : "blobconttestainer", container_access_type = "private" }]
   skuname                     = "Standard"
   resource_group_location     = "Central india"
  access_tier                  = "Standard"
  account_replication_type     = "LRS"
   account_kind                = "StorageV2"
  shared_access_key_enabled    = true
  static_website               = null
  public_ip                    = "example-pip"
  allocation_method            = "Static"
  lb_name                      = "lb-example"
  azurerm_private_link_service = "privatelinkservice-example"
  private_endpoint             = "private-endpoint"
  pvt_dns_zone_name            = "mydnszone.com"
  pvt_dns_zone_name_link       = "vnet-private-zone-link"
  vnet_name                    = "Test-Vnet" 
  subnet_name                  = "default"
  private_service_connection   = "example-privateserviceconnection"
  enable_private_endpoint      =  true
  sub_resource_name            = ["blob"]
  lifecycles = [
    {
      prefix_match               = ["mystore250/folder_path"]
      tier_to_cool_after_days    = 0
      tier_to_archive_after_days = 50
      delete_after_days          = 100
      snapshot_delete_after_days = 30
    },
    {
      prefix_match               = ["blobstore251/another_path"]
      tier_to_cool_after_days    = 0
      tier_to_archive_after_days = 30
      delete_after_days          = 75
      snapshot_delete_after_days = 30
    }
  ]