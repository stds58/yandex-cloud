variable "target_group_name" {
  description = "Имя целевой группы"
  type        = string
}

variable "region_id" {
  description = "ID региона для целевой группы"
  type        = string
}

variable "targets" {
  description = "Список целей (инстансов) для балансировщика"
  type = list(object({
    subnet_id = string
    address   = string
  }))
}

variable "nlb_name" {
  description = "Имя Network Load Balancer"
  type        = string
}

variable "listener_name" {
  description = "Имя listener'а"
  type        = string
}

variable "listener_port" {
  description = "Порт listener'а"
  type        = number
}

variable "target_port" {
  description = "Целевой порт для перенаправления трафика"
  type        = number
}

variable "healthcheck_name" {
  description = "Имя healthcheck'а"
  type        = string
}

variable "healthcheck_port" {
  description = "Порт для healthcheck'а"
  type        = number
}

variable "healthcheck_path" {
  description = "Путь для healthcheck'а"
  type        = string
}

variable "folder_id" {
  description = "ID каталога в Yandex Cloud"
  type        = string
}

variable "cloud_id" {
  type = string
}

variable "token" {
  type = string
}

variable "zone" {                                # Используем переменную для передачи в конфиг инфраструктуры
  description = "Use specific availability zone" # Опционально описание переменной
  type        = string                           # Опционально тип переменной
  default     = "ru-central1-a"
}