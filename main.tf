




# создаём сервис учётку SA
resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name = "sa-shqiptar"
}

# даём права на запись для этой SA
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

# создаём ключи доступа Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}


resource "yandex_vpc_network" "network_a" { # Создаем VPC
  name = "network_a"
}

resource "yandex_vpc_subnet" "subnetwork_a" { # Настраиваем VPC
  name           = "subnetwork_a"
  zone           = var.zone
  network_id     = yandex_vpc_network.network_a.id # Берем output переменную из другого ресурса
  v4_cidr_blocks = ["192.168.10.0/24"] # Указываем CIDR для подсети
}

# Получаем информацию об образе
data "yandex_compute_image" "ubuntu" {
  #family = "ubuntu-2004-lts" # Используем семейство образов Ubuntu 20.04 LTS
  family = "lemp"
}

# Создаем виртуальную машину
resource "yandex_compute_instance" "lemp_server" {
  name        = "lemp_server"
  platform_id = "standard-v2" # Intel Cascade Lake
  zone        = var.zone

  resources {
    cores  = 2 # Определяет количество vCPU
    memory = 2 # Определяет объем RAM в гигабайтах
    core_fraction = 5 # Определяет гарантированную долю CPU в процентах
  }

  boot_disk {
    initialize_params {
      #image_id = "fd81hgrcv6lsnkremf32" # Ubuntu 20.04 LTS
      image_id = data.yandex_compute_image.ubuntu.id # Используем ID образа из data
      size = var.size
      type = var.type
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnetwork_a.id
    nat       = true             # Включить NAT для доступа в интернет
  }

  metadata = {
    #user-data = var.user-data
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_cloud_20250211.pub")}" # подключение ssh -i "C:\Users\valar\.ssh\yandex_cloud_20250211" ubuntu@158.160.46.63"
  }

  scheduling_policy {
    preemptible = true # Делаем виртуальную машину прерываемой
  }

}



