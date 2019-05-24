/**
 * General Variables
 */
variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "name" {
  type = string
}

/**
 * Mysql suffix
 */
variable "mysql_suffix" {
  type = string
  description = "MySQL Servernames need to be unique over the whole azure cloud"
}

/**
 * Mysql Server sizing
 */
variable "mysql_version" {
  type = string
  description = "MySQL Version"
  default = "5.7"
}

variable "mysql_sku_capacity" {
  type = number
  description = "Choose one of 1, 2, 4, 8, 16, 32, 64"
}

variable "mysql_sku_family" {
  type = string
  description = "Choose one of Gen4, Gen5"
}

variable "mysql_sku_tier" {
  type = string
  description = "Choose one of Basic, GeneralPurpose, MemoryOptimized"
}

variable "mysql_sku_tier_map" {
  type = map(string)
  description = "This will map the choosen sku tier to the correct shortener used in the sku name"
  default = {
    BasicBasic = "B"
    GeneralPurpose = "GP"
    MemoryOptimized = "MO"
  }
}

variable "mysql_storage_mb" {
  type = number
  description = "Storage size in MB"
  default = 102400 # 100 GB
}

variable "mysql_backup_retention_days" {
  type = number
  description = "Backup retention days"
  default = 7
}

/**
 * MySQL Configurations
 *
 * Use a Map with key:value pairs of configuration options
 *
 * e.g.:
 * mysql_configurations = {
 *   interactive_timeout  = "600"
 *   innodb_log_file_size = "512"
 * }
 */
variable "mysql_configurations" {
  type = map
  description = "Map with key:value pairs of configuration options"
  default = {}
}

/**
 * MySQL VNet rules
 *
 * Use a List with Map items of VNet Rules
 *
 * e.g.:
 * mysql_virtual_network_rules = [
 *   {
 *     name      = __RULE_NAME__
 *     subnet_id = __SUBNET_ID__ e.g. (/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/XXX/providers/Microsoft.Network/virtualNetworks/XXX/subnets/XXX)
 *   },
 *   {
 *     name      = __RULE_NAME__
 *     subnet_id = __SUBNET_ID__ e.g. (/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/XXX/providers/Microsoft.Network/virtualNetworks/XXX/subnets/XXX)
 *   }
 * ]
 */
variable "mysql_virtual_network_rules" {
  type = list
  description = "List of Maps with VNET rules"
  default = []
}

/**
 * MySQL Login credentials
 */
variable "mysql_admin_user" {
  type = string
  description = "MySQL Login user name"
}

variable "mysql_admin_password" {
  type = string
  description = "MySQL Login password"
}

/**
 * Bastian Host sizing
 */
variable "bastion_vm_size" {
  type = string
  description = "Bastion host VM size"
  default = "Standard_B1ls"
}

/**
 * Bastion Host OS
 *
 * run "az vm image list --output table"nto show a table of available images
 */
variable "bastion_os_publisher" {
  type = string
  default = "Canonical"
  description = "OS Image Publisher"
}

variable "bastion_os_offer" {
  type = string
  default = "UbuntuServer"
  description = "OS Image Offer"
}

variable "bastion_os_sku" {
  type = string
  default = "18.04-LTS"
  description = "OS Image Sku"
}

variable "bastion_os_version" {
  type = string
  default = "latest"
  description = "OS Image Version"
}

/**
 * Bastian Host authentication
 */
variable "admin_user" {
  type = string
  description = "Linux Login user name"
}

variable "pub_key" {
  type = string
  description = "Linux login public key"
}
