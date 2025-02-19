
output "access_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  sensitive = true # не будет выведено в консоль, но можно посмотреть так terraform output -raw access_key
}

output "secret_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  sensitive = true # не будет выведено в консоль, но можно посмотреть так terraform output -raw secret_key
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.lemp_server.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.lemp_server.network_interface.0.nat_ip_address
}
