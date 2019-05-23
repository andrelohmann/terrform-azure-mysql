variable "location" {
  type = string
  default = "westeurope"
}

variable "vm_size" {
  type = string
  default = "Standard_B1ls"
}

variable "pub_key" {
  type = string
}

variable "admin_user" {
  type = string
}
