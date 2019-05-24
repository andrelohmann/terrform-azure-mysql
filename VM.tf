resource "azurerm_virtual_machine" "mysql_stack" {
    name                  = "${var.name}-bastion"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.mysql_stack.name}"
    network_interface_ids = ["${azurerm_network_interface.mysql_stack.id}"]
    vm_size               = "${var.bastion_vm_size}"

    storage_os_disk {
        name              = "${var.name}-bastian-osdisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
        publisher = "${var.bastion_os_publisher}"
        offer     = "${var.bastion_os_offer}"
        sku       = "${var.bastion_os_sku}"
        version   = "${var.bastion_os_version}"
    }

    os_profile {
        computer_name  = "${var.environment}-${var.name}-bastion"
        admin_username = "${var.admin_user}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/${var.admin_user}/.ssh/authorized_keys"
            key_data = "${var.pub_key}"
        }
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.mysql_stack.primary_blob_endpoint}"
    }

    tags = {
        environment = "${var.location}"
    }
}
