output "consul_vm_id" {
  value = vsphere_virtual_machine.consul_vm_1.id
}
output "consul_vm_default_ip_address" {
  value = vsphere_virtual_machine.consul_vm_1.default_ip_address
}
output "consul_vm_moid" {
  value = vsphere_virtual_machine.consul_vm_1.moid
}