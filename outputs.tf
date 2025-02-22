
output "internal_ip_address_lemp_server" {
  value = module.lemp_instance_preemptible.internal_ip_address
}

output "external_ip_address_lemp_server" {
  value = module.lemp_instance_preemptible.external_ip_address
}

output "internal_ip_address_lamp_server" {
  value = module.lamp_instance_preemptible.internal_ip_address
}

output "external_ip_address_lamp_server" {
  value = module.lamp_instance_preemptible.external_ip_address
}

output "nlb_ip_load_balancer" {
  value = module.load_balancer.nlb_ip
}
