# Create Network Card for web VM
resource "azurerm_network_interface" "web-private-nic" {
  depends_on=[azurerm_resource_group.rg]

  name                = "web-nic"
  location            = "ukwest"
  resource_group_name = azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }

}

resource "azurerm_linux_virtual_machine" "oraclelinux" {
  depends_on=[azurerm_network_interface.web-private-nic]
  name                = "OLE8"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "ukwest"
  size                = "Standard_B1s"
  admin_username      = "stuntbadger"
  computer_name = "AzureLinux.local"
 
#  delete_os_disk_on_termination    = var.web_delete_os_disk_on_termination
#  delete_data_disks_on_termination = var.web_delete_data_disks_on_termination
 
  network_interface_ids = [
    azurerm_network_interface.web-private-nic.id,
  ]
  
  
  admin_ssh_key {
    username   = "stuntbadger"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Oracle"
    offer     = "Oracle-Linux"
    sku       = "ol85-lvm"
    version   = "latest"
  }
}

# Create Linux VM with web server
#resource "azurerm_virtual_machine" "web-vm" {
#  depends_on=[azurerm_network_interface.web-private-nic]

#  location              = "ukwest"
#  resource_group_name   = azurerm_resource_group.rg.name
#  name                  = "web-${random_string.web-vm-name.result}-vm"
#  network_interface_ids = [azurerm_network_interface.vnet.id]
#  vm_size               = "Standard_B2s"
  #license_type          = var.web_license_type

#  delete_os_disk_on_termination    = var.web_delete_os_disk_on_termination
#  delete_data_disks_on_termination = var.web_delete_data_disks_on_termination

#  storage_image_reference {
#    id        = lookup(var.web_vm_image, "id", null)
#    offer     = lookup(var.web_vm_image, "offer", null)
#    publisher = lookup(var.web_vm_image, "publisher", null)
#    sku       = lookup(var.web_vm_image, "sku", null)
#    version   = lookup(var.web_vm_image, "version", null)
#  }

#  storage_os_disk {
#    name              = "web-${random_string.web-vm-name.result}-disk"
#    caching           = "ReadWrite"
#    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
#  }

#  os_profile {
#    computer_name  = "web-${random_string.web-vm-name.result}-vm"
#    admin_username = var.web_admin_username
#    admin_password = random_password.web-vm-password.result
#    custom_data    = file("azure-user-data.sh")
#  }

#  os_profile_linux_config {
#    disable_password_authentication = false
#  }
#}
