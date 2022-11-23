variable "instance_index" {
  type = number
  validation {
    condition     = var.instance_index > 0 && var.instance_index < 100
    error_message = "Must be a 2 dights number."
  }
  description = "Resource type index on the resource group."
}

variable "storage_account_name" {
  type        = string
  description = "Specifies a custom name for the resource."
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "Specifies the parent resource group name."
  default = ""
}

variable "resource_group_location" { 
  type = string
  description = "Specifies the parent resource group location."
  default  = ""
}


variable "account_kind" {
  description = "The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  default     = ""
}

variable "account_replication_type" {
  type =string
  default =""  
}

variable "skuname" {
  description = "The SKUs supported by Microsoft Azure Storage. Valid options are Premium_LRS, Premium_ZRS, Standard_GRS, Standard_GZRS, Standard_LRS, Standard_RAGRS, Standard_RAGZRS, Standard_ZRS"
  default     = ""
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
  default     = ""
}

variable "shared_access_key_enabled" {
  description = "Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD)."
  default     = true
}
variable "enable_https_traffic_only" {
  default = true
  
}
variable "static_website" {
  description = "Static web site configuration. static_website can only be set when the account_kind is set to StorageV2 or BlockBlobStorage."
  type        = object({ index_document = string, error_404_document = string })
  default     = null
}

variable "network_rules" {
  description = "Network rules restricing access to the storage account."
  type        = object({ bypass = list(string), ip_rules = list(string), subnet_ids = list(string) })
  default     = null
}

variable "container" {
  description = "List of containers to create and their access levels."
  type        = list(object({ name = string, container_access_type = string }))
  default     = []
}
variable "identity_type" {
  type = string 
  default = null 
}

variable "pvt_dns_zone_name" {
  type        = string
  default     = "mydnszone.com"
  description = "private dns zone name"
}

variable "pvt_dns_zone_name_link" {
  type        = string
  default     = "vnet-private-zone-link"
  description = "private dns zone name link"
}
variable "vnet_name" {
  type = string
  default = "Test-Vnet"  
}
variable "subnet_name" {
  type = string
  default = "default"
}
variable "subnet_name1" {
  type = string
  default = "privatelinksubnet"
}
variable "private_service_connection" {
  type    = string
  default = "example-privateserviceconnection"
  
}
variable "public_ip" {
  type = string
  default = "example-pip"
}
variable "allocation_method" {
  type = string
  default = "Static"  
}
variable "lb_name" {
  type = string
  default = "lb-example"
}
variable "azurerm_private_link_service" {
  type = string
  default = "privatelinkservice-example"
}
variable "private_endpoint" {
  type = string
  default = "private-endpoint"
}
variable "lifecycles" {
  description = "Configure Azure Storage firewalls and virtual networks"
  type        = list(object({ prefix_match = set(string), tier_to_cool_after_days = number, tier_to_archive_after_days = number, delete_after_days = number, snapshot_delete_after_days = number }))
  default     = []
}
variable "enable_private_endpoint" {
  default     = false
  type        = bool
}
variable "private_service_connection_name" {
  description = "The name of the service connection"
  default     = "vnet-private-zone-link"
  type        = string
}
variable "sub_resource_name" {
  description = "The name of sub resource "
  default     = ["blob"]
  type        = list(string)
}
