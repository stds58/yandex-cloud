
output "access_key" {
  value     = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  sensitive = true # не будет выведено в консоль, но можно посмотреть так terraform output -raw access_key
}

output "secret_key" {
  value     = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  sensitive = true # не будет выведено в консоль, но можно посмотреть так terraform output -raw secret_key
}


