
variable "zone" {
  description = "Use specific availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "folder_id" {
  description = "ID каталога в Yandex Cloud"
  type        = string
  default     = ""
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


variable "cloud_id" {
  type = string
  default     = ""
}

variable "token" {
  type = string
  default     = ""
}

variable "bucket" {
  description = "Name of the bucket for storing Terraform state"
  default     = "terraform-state-bucket"
  type        = string
}