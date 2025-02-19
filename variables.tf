
variable "zone" {                                # Используем переменную для передачи в конфиг инфраструктуры
  description = "Use specific availability zone" # Опционально описание переменной
  type        = string                           # Опционально тип переменной
  default     = "ru-central1-a"                  # Опционально значение по умолчанию для переменной
}

variable "size" {
  description = "Size of the boot disk in GB"
  type        = string
  default     = "10"
}

variable "type" {
  description = <<-EOT
    Type of the boot disk.
    Network SSD (network-ssd): Fast network drive; SSD network block storage.
    Network HDD (network-hdd): Standard network drive; HDD network block storage.
    Non-replicated SSD (network-ssd-nonreplicated): Enhanced performance network drive without redundancy.
    Ultra high-speed network storage with three replicas (SSD) (network-ssd-io-m3): High-performance SSD offering the same speed as network-ssd-nonreplicated, plus redundancy.
    Local disk drives on dedicated hosts.
  EOT
  type        = string
  default     = "network-ssd"
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

variable "folder_id" {
  type    = string
}

variable "cloud_id" {
  type    = string
}

variable "token" {
  type    = string
}

variable "service_account_key_file" {
  description = "Path to the service account key file for Yandex Cloud"
}




variable "storage_access_key" {
  description = "Access key for Yandex Object Storage"
}

variable "storage_secret_key" {
  description = "Secret key for Yandex Object Storage"
}

variable "bucket" {
  description = "Name of the bucket for storing Terraform state"
  default     = "terraform-state-bucket"
}