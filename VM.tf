resource "azurerm_virtual_machine" "TestVM" {
    name                  = "TestVM"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.TestRG.name}"
    network_interface_ids = ["${azurerm_network_interface.TestNIC.id}"]
    vm_size               = "${var.vm_size}"

    storage_os_disk {
        name              = "TestOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "TestVM"
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
        storage_uri = "${azurerm_storage_account.TestSA.primary_blob_endpoint}"
    }

    tags = {
        environment = "Terraform Demo"
    }
}
