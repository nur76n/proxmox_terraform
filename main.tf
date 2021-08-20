terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.7.4"
    }
    local = {
      source = "hashicorp/local"
    }
    null = {
      source = "hashicorp/null"
    }
    template = {
      source = "hashicorp/template"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://${var.pve_addr}:8006/api2/json"
  pm_user         = var.pve_user
  pm_password     = var.pve_password
  pm_tls_insecure = true
  pm_timeout      = 1800
}


resource "proxmox_vm_qemu" "cloudinit-test" {
  count       = length(var.vms)
  vmid = "1${var.vms[count.index].number}"
  name        = "${var.vms[count.index].name}-${var.vms[count.index].number}"
  desc        = "tf description"
  target_node = "pve1"

  clone = "ubuntu-cloud-init-template"

  pool    = "tf"
  boot    = "cdn"
  hotplug = "network,disk,usb"

  disk {
    backup  = 0
    type    = "scsi"
    storage = "local-lvm-cached"
    size    = "8G"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  cores   = 4
  sockets = 1
  memory  = 2048

  os_type    = "cloud-init"
  ciuser     = var.vm_user
  cipassword = var.vm_password
  ipconfig0  = "ip=${var.vms[count.index].ip_addr_pref}.${var.vms[count.index].number}/24,gw=10.8.1.1"
  agent      = 1

  sshkeys = join("\n", var.vm_public_ssh_keys)

}