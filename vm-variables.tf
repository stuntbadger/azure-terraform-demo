# Azure virtual machine storage settings #

variable "web_delete_os_disk_on_termination" {
  type        = string
  description = "Should the OS Disk (either the Managed Disk / VHD Blob) be deleted when the Virtual Machine is destroyed?"
  default     = "true"  # Update for your environment
}

variable "web_delete_data_disks_on_termination" {
  description = "Should the Data Disks (either the Managed Disks / VHD Blobs) be deleted when the Virtual Machine is destroyed?"
  type        = string
  default     = "true" # Update for your environment
}

variable "web_vm_image" {
  type        = map(string)
  description = "Virtual machine source image information"
  default     = {
  publisher = "Oracle"
  offer     = "Oracle-Linux"
  sku       = "ol85-lvm" 
  version   = "latest"
  }
}

