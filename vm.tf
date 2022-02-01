# Create the VM Rhel web server 
resource "azurerm_linux_virtual_machine" "web_vm" {
  depends_on=[azurerm_network_interface.web-private-nic, azurerm_public_ip.publicip]
  name                = var.vm_web_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  size                = var.web_vm_size
  admin_username      = var.web_vm_username
  computer_name = var.web_hostname
 
  network_interface_ids = [
    azurerm_network_interface.web-private-nic.id,
  ]
  
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    offer     = lookup(var.web_vm_image, "offer", null)
    publisher = lookup(var.web_vm_image, "publisher", null)
    sku       = lookup(var.web_vm_image, "sku", null)
    version   = lookup(var.web_vm_image, "version", null)
  }
}

