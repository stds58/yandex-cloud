
# Создаём сервисную учётку
resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = var.sa_name
}

# Даём права на запись для этой SA
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = var.role
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

# Создаём ключи доступа Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = var.static_key_description
}
