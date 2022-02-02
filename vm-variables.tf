variable "web_vm_size" {
  default = "Standard_B1s"
}
variable "web_vm_username" {
  default = "azureuser"
}

variable "web_hostname" {
  default = "webserver1.local"
}
variable "vm_web_name" {
  default = "RHEL8_web"
}
#variable "web_vm_image" {
#  type        = map(string)
#  description = "Virtual machine source image information"
#  default     = {
#  offer     = "Oracle-Linux"
#  publisher = "Oracle"
#  sku       = "ol85-lvm" 
#  version   = "latest"
#  }
#}

# to find the vm information you can run the following command 
# az vm image list --publisher redhat --all --output tabl
#
variable "web_vm_image" {
  type        = map(string)
  description = "Virtual machine source image information"
  default = {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm-gen2"
    version   = "latest"
  }
}
