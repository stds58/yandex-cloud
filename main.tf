

# Используем модуль для создания сервисной учётки
module "service_account" {
  source = "./modules/service_account"

  folder_id              = var.folder_id
  cloud_id               = var.cloud_id
  token                  = var.token
  sa_name                = "sa-shqiptar"
  role                   = "storage.editor"
  static_key_description = "static access key for object storage"
}


module "network_a" {
  source    = "./modules/network"
  folder_id = var.folder_id
  cloud_id  = var.cloud_id
  token     = var.token

  name = "network_a1"
}

# Используем модуль для создания первой подсети (ru-central1-a)
module "subnetwork_a" {
  source    = "./modules/subnet"
  folder_id = var.folder_id
  cloud_id  = var.cloud_id
  token     = var.token

  subnet_name    = "subnetwork_a"
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["192.168.10.0/24"]
  network_id = module.network_a.network_id
}

# Используем модуль для создания второй подсети (ru-central1-b)
module "subnetwork_b" {
  source    = "./modules/subnet"
  folder_id = var.folder_id
  cloud_id  = var.cloud_id
  token     = var.token

  subnet_name    = "subnetwork_b"
  zone           = "ru-central1-b"
  v4_cidr_blocks = ["192.168.20.0/24"]
  network_id = module.network_a.network_id
}


# Получаем информацию об образе
data "yandex_compute_image" "lemp" {
  family = "lemp"
}

data "yandex_compute_image" "lamp" {
  family = "lamp"
}

module "lemp_instance_preemptible" {
  source    = "./modules/instance"
  folder_id = var.folder_id
  cloud_id  = var.cloud_id
  token     = var.token

  name          = "lemp_server"
  platform_id   = "standard-v2" # Intel Cascade Lake
  zone          = "ru-central1-a"
  cores         = 2
  memory        = 2
  core_fraction = 5
  image_id      = data.yandex_compute_image.lemp.id # Используем ID образа из data
  disk_size     = 10
  disk_type     = "network-ssd"
  subnet_id     = module.subnetwork_a.subnet_id
  ssh_key_path  = "~/.ssh/yandex_cloud_20250211.pub"
}

module "lamp_instance_preemptible" {
  source    = "./modules/instance"
  folder_id = var.folder_id
  cloud_id  = var.cloud_id
  token     = var.token

  name          = "lamp_server"
  platform_id   = "standard-v2"
  zone          = "ru-central1-b"
  cores         = 2
  memory        = 2
  core_fraction = 5
  image_id      = data.yandex_compute_image.lamp.id
  disk_size     = 10
  disk_type     = "network-ssd"
  subnet_id     = module.subnetwork_b.subnet_id
  ssh_key_path  = "~/.ssh/yandex_cloud_20250211.pub"
}





