variable "pve_user" {
  description = "pve user"
  type        = string
}

variable "pve_password" {
  description = "pve password"
  type        = string
}

variable "pve_addr" {
  description = "pve address"
  type        = string
}

variable "vm_user" {
  description = "vm user"
  type        = string
}

variable "vm_password" {
  description = "vm password"
  type        = string
}

variable "vms" {
  description = "List of resources to create"
  type        = list(any)
  default = [
    { "number" = "20", "name" = "gluster", "ip_addr_pref" = "10.8.1" },
    { "number" = "21", "name" = "gluster", "ip_addr_pref" = "10.8.1" },
    { "number" = "22", "name" = "gluster", "ip_addr_pref" = "10.8.1" }
  ]
}

variable "vm_public_ssh_keys" {
  description = "vm public_ssh_keys"
  type        = list(string)
}

variable "mikrotik_ip" {
  description = "mikrotik_ip"
  type        = string
}

variable "mikrotik_user" {
  description = "mikrotik_user"
  type        = string
}

variable "mikrotik_pwd" {
  description = "mikrotik_pwd"
  type        = string
}