provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "consul_vm_template" {
  name          = var.consul_template_name
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "consul_leader_vm" {
  name             = var.consul_leader_vm_name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.consul_vm_cpu_cores
  memory   = var.consul_vm_memory
  guest_id = data.vsphere_virtual_machine.consul_vm_template.guest_id

  scsi_type = data.vsphere_virtual_machine.consul_vm_template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.consul_vm_template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.consul_vm_template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.consul_vm_template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.consul_vm_template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.consul_vm_template.id

    customize {
      linux_options {
        host_name = var.consul_leader_host_name
        domain    = var.consul_host_domain_name
      }

      network_interface {
        ipv4_address = var.consul_leader_ip_address
        ipv4_netmask = var.consul_ip_netmask
      }

      ipv4_gateway = var.consul_ip_gateway
      dns_server_list = var.consul_dns_servers
    }
  }
}