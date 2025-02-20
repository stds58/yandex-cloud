
variable "zone" {                                # Используем переменную для передачи в конфиг инфраструктуры
  description = "Use specific availability zone" # Опционально описание переменной
  type        = string                           # Опционально тип переменной
  default     = "ru-central1-a"
}

variable "folder_id" {
  description = "ID каталога в Yandex Cloud"
  type        = string
}

variable "sa_name" {
  description = "Имя сервисной учётки"
  type        = string
}

variable "role" {
  description = "Роль для назначения сервисной учётке"
  type        = string
}

variable "static_key_description" {
  description = "Описание для статического ключа доступа"
  type        = string
}

variable "cloud_id" {
  type = string
  default     = ""
}

variable "token" {
  type = string
  default     = ""
}

variable "service_account_key_file" {
  description = "Path to the service account key file for Yandex Cloud"
  type        = string
  default     = ""
}

variable "storage_access_key" {
  description = "Access key for Yandex Object Storage"
  type        = string
  default     = ""
}

variable "storage_secret_key" {
  description = "Secret key for Yandex Object Storage"
  type        = string
  default     = ""
}