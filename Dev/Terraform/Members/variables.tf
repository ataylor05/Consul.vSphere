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
variable "consul_template_name" {
  type = string
  default = "consul-member-template"
}
variable "consul_member_1_vm_name" {
  type = string
  default = "Dev-Consul-2"
}
variable "consul_member_2_vm_name" {
  type = string
  default = "Dev-Consul-3"
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

# Common network vars
variable "consul_host_domain_name" {
  type = string
  default = "anet.local"
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

# Consul Member 1 VM OS vars
variable "consul_member_1_host_name" {
  type = string
  default = "dev-consul-2"
}
variable "consul_member_1_ip_address" {
  type = string
  default = "192.168.1.5"
}

# Consul Member 2 VM OS vars
variable "consul_member_2_host_name" {
  type = string
  default = "dev-consul-3"
}
variable "consul_member_2_ip_address" {
  type = string
  default = "192.168.1.6"
}