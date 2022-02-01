# Create Security Group for the VM
resource "azurerm_network_security_group" "web-vm-nsg" {
  depends_on=[azurerm_resource_group.rg]

  name                = var.Network_security_group_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowWEB"
    description                = "Allow web"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowSSH"
    description                = "Allow SSH"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  tags = {
    environment = var.Tags_enviroment
  }
}

# Associate the web NSG with the subnet
resource "azurerm_subnet_network_security_group_association" "web-vm-nsg-association" {
  depends_on=[azurerm_resource_group.rg]

  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.web-vm-nsg.id
}
