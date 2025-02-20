
# Создаём VPC
resource "yandex_vpc_network" "network" {
  name = var.network_name
}

# Создаём подсеть
resource "yandex_vpc_subnet" "subnet" {
  name           = var.subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.v4_cidr_blocks
}
