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
    { "number" = "85", "name" = "swarm", "ip_addr_pref" = "10.8.1" },
    { "number" = "86", "name" = "swarm", "ip_addr_pref" = "10.8.1" }
  ]
}

variable "vm_public_ssh_keys" {
  description = "vm public_ssh_keys"
  type        = list(string)
}