
variable "zone" {                                # Используем переменную для передачи в конфиг инфраструктуры
  description = "Use specific availability zone" # Опционально описание переменной
  type        = string                           # Опционально тип переменной
  default     = "ru-central1-a"
}

variable "name" {
  description = "Имя_инстанса"
  type        = string
}

variable "platform_id" {
  description = "Тип платформы (например, standard-v2)"
  type        = string
}

variable "cores" {
  description = "Количество vCPU # Определяет количество vCPU"
  type        = number
}

variable "memory" {
  description = "Объем RAM в ГБ # Определяет объем RAM в гигабайтах"
  type        = number
}

variable "core_fraction" {
  description = "Гарантированная доля CPU в процентах # Определяет гарантированную долю CPU в процентах"
  type        = number
}

variable "image_id" {
  description = "ID образа для загрузочного диска"
  type        = string
}

variable "disk_size" {
  description = "Размер загрузочного диска в ГБ"
  type        = number
}

variable "disk_type" {
  description = <<-EOT
    Type of the boot disk. Тип загрузочного диска
    Network SSD (network-ssd): Fast network drive; SSD network block storage.
    Network HDD (network-hdd): Standard network drive; HDD network block storage.
    Non-replicated SSD (network-ssd-nonreplicated): Enhanced performance network drive without redundancy.
    Ultra high-speed network storage with three replicas (SSD) (network-ssd-io-m3): High-performance SSD offering the same speed as network-ssd-nonreplicated, plus redundancy.
    Local disk drives on dedicated hosts.
  EOT
  type        = string
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "ssh_key_path" {
  description = "Путь к SSH-ключу" # подключение ssh -i "C:\Users\valar\.ssh\yandex_cloud_20250211" ubuntu@158.160.46.63"
  type        = string
}

variable "preemptible" {
  description = "Прерываемый инстанс"
  type        = bool
  default     = true
}

variable "folder_id" {
  description = "ID каталога в Yandex Cloud"
  type        = string
  default     = ""
}

variable "cloud_id" {
  type        = string
  default     = ""
}

variable "token" {
  type = string
  default     = ""
}