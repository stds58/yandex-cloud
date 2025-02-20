
variable "zone" {                                # Используем переменную для передачи в конфиг инфраструктуры
  description = "Use specific availability zone" # Опционально описание переменной
  type        = string                           # Опционально тип переменной
  default     = "ru-central1-a"
}

variable "folder_id" {
  description = "ID каталога в Yandex Cloud"
  type        = string
  default     = ""
}

variable "cloud_id" {
  type    = string
  default = ""
}

variable "token" {
  type    = string
  default = ""
}

variable "bucket" {
  description = "Name of the bucket for storing Terraform state"
  default     = "terraform-state-bucket"
  type        = string
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

variable "preemptible" {
  description = "Прерываемый инстанс"
  type        = bool
  default     = true
}

variable "user-data" {
  description = "установка на убунту пыхи,нгинкса и мускула для family = ubuntu-2004-lts # Используем семейство образов Ubuntu 20.04 LTS"
  type        = string
  default     = <<-EOF
      #cloud-config
      package_update: true
      packages:
        - nginx
        - mariadb-server
        - php-fpm
        - php-mysql
      runcmd:
        - systemctl enable nginx
        - systemctl start nginx
        - systemctl enable mariadb
        - systemctl start mariadb
        - systemctl enable php7.4-fpm
        - systemctl start php7.4-fpm
        - mysql -e "CREATE DATABASE lemp_db;"
        - mysql -e "CREATE USER 'lemp_user'@'localhost' IDENTIFIED BY 'p@rol';"
        - mysql -e "GRANT ALL PRIVILEGES ON lemp_db.* TO 'lemp_user'@'localhost';"
        - mysql -e "FLUSH PRIVILEGES;"
        - echo "<?php phpinfo(); ?>" > /var/www/html/index.php
        - chown -R www-data:www-data /var/www/html
        - chmod -R 755 /var/www/html
      EOF
}

variable "subnet_name" {
  description = "Имя подсети"
  type        = string
  default     = "subnet_name"
}

variable "v4_cidr_blocks" {
  description = "CIDR блоки для подсети"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "network_id" {
  description = "ID of the VPC network"
  type        = string
}

variable "sa_name" {
  description = "Имя сервисной учётки"
  type        = string
  default     = ""
}

variable "role" {
  description = "Роль для назначения сервисной учётке"
  type        = string
  default     = ""
}

variable "static_key_description" {
  description = "Описание для статического ключа доступа"
  type        = string
  default     = ""
}
