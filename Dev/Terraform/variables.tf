# vSphere vars
variable "vsphere_server" {
  type = string
  default = "vcsa.anet.local"
}
variable "vsphere_user" {
  type = string
  default = "administrator@vsphere.local"
}
variable "vsphere_password" {
  type = string
}
variable "vsphere_datacenter" {
  type = string
  default = "home"
}
variable "vsphere_datastore" {
  type = string
  default = "datastore1"
}
variable "vsphere_cluster" {
  type = string
  default = "nodes"
}
variable "vsphere_network" {
  type = string
  default = "VM Network"
}
variable "consul_vm_name" {
  type = string
  default = "Consul-1"
}
variable "consul_template_name" {
  type = string
  default = "consul-template"
}

# VM vars
variable "consul_vm_cpu_cores" {
  type = number
  default = 2
}
variable "consul_vm_memory" {
  type = number
  default = 2048
}

# OS vars
variable "consul_host_name" {
  type = string
  default = "consul-1"
}
variable "consul_host_domain_name" {
  type = string
  default = "anet.local"
}
variable "consul_ip_address" {
  type = string
  default = "192.168.1.4"
}
variable "consul_ip_netmask" {
  type = number
  default = 24
}
variable "consul_ip_gateway" {
  type = string
  default = "192.168.1.1"
}
variable "consul_dns_servers" {
    type    = list
    default = ["192.168.1.1"]
}
variable "consul_root_password" {
    type    = string
}