variable "location" {
  default = "westeurope"
}

variable "vm_size" {
  default = "Standard_B1ls"
}

variable "pub_key" {
  type = string
}

variable "admin_user" {
  type = string
}
