output "consul_leader_vm_id" {
  value = vsphere_virtual_machine.consul_leader_vm.id
}
output "consul_leader_vm_default_ip_address" {
  value = vsphere_virtual_machine.consul_leader_vm.default_ip_address
}
output "consul_leader_vm_moid" {
  value = vsphere_virtual_machine.consul_leader_vm.moid
}