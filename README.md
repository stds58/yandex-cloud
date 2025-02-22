<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.138.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.138.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lamp_instance_preemptible"></a> [lamp\_instance\_preemptible](#module\_lamp\_instance\_preemptible) | ./modules/instance | n/a |
| <a name="module_lemp_instance_preemptible"></a> [lemp\_instance\_preemptible](#module\_lemp\_instance\_preemptible) | ./modules/instance | n/a |
| <a name="module_load_balancer"></a> [load\_balancer](#module\_load\_balancer) | ./modules/load_balancer | n/a |
| <a name="module_network_a"></a> [network\_a](#module\_network\_a) | ./modules/network | n/a |
| <a name="module_service_account"></a> [service\_account](#module\_service\_account) | ./modules/service_account | n/a |
| <a name="module_subnetwork_a"></a> [subnetwork\_a](#module\_subnetwork\_a) | ./modules/subnet | n/a |
| <a name="module_subnetwork_b"></a> [subnetwork\_b](#module\_subnetwork\_b) | ./modules/subnet | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_compute_image.lamp](https://registry.terraform.io/providers/yandex-cloud/yandex/0.138.0/docs/data-sources/compute_image) | data source |
| [yandex_compute_image.lemp](https://registry.terraform.io/providers/yandex-cloud/yandex/0.138.0/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | Name of the bucket for storing Terraform state | `string` | `"terraform-state-bucket"` | no |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | n/a | `string` | `""` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID каталога в Yandex Cloud | `string` | `""` | no |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | Прерываемый инстанс | `bool` | `true` | no |
| <a name="input_role"></a> [role](#input\_role) | Роль для назначения сервисной учётке | `string` | `""` | no |
| <a name="input_sa_name"></a> [sa\_name](#input\_sa\_name) | Имя сервисной учётки | `string` | `""` | no |
| <a name="input_service_account_key_file"></a> [service\_account\_key\_file](#input\_service\_account\_key\_file) | Path to the service account key file for Yandex Cloud | `string` | `""` | no |
| <a name="input_static_key_description"></a> [static\_key\_description](#input\_static\_key\_description) | Описание для статического ключа доступа | `string` | `""` | no |
| <a name="input_storage_access_key"></a> [storage\_access\_key](#input\_storage\_access\_key) | Access key for Yandex Object Storage | `string` | `""` | no |
| <a name="input_storage_secret_key"></a> [storage\_secret\_key](#input\_storage\_secret\_key) | Secret key for Yandex Object Storage | `string` | `""` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Имя подсети | `string` | `"subnet_name"` | no |
| <a name="input_token"></a> [token](#input\_token) | n/a | `string` | `""` | no |
| <a name="input_user-data"></a> [user-data](#input\_user-data) | установка на убунту пыхи,нгинкса и мускула для family = ubuntu-2004-lts # Используем семейство образов Ubuntu 20.04 LTS | `string` | `"#cloud-config\r\npackage_update: true\r\npackages:\r\n  - nginx\r\n  - mariadb-server\r\n  - php-fpm\r\n  - php-mysql\r\nruncmd:\r\n  - systemctl enable nginx\r\n  - systemctl start nginx\r\n  - systemctl enable mariadb\r\n  - systemctl start mariadb\r\n  - systemctl enable php7.4-fpm\r\n  - systemctl start php7.4-fpm\r\n  - mysql -e \"CREATE DATABASE lemp_db;\"\r\n  - mysql -e \"CREATE USER 'lemp_user'@'localhost' IDENTIFIED BY 'p@rol';\"\r\n  - mysql -e \"GRANT ALL PRIVILEGES ON lemp_db.* TO 'lemp_user'@'localhost';\"\r\n  - mysql -e \"FLUSH PRIVILEGES;\"\r\n  - echo \"<?php phpinfo(); ?>\" > /var/www/html/index.php\r\n  - chown -R www-data:www-data /var/www/html\r\n  - chmod -R 755 /var/www/html\r\n"` | no |
| <a name="input_v4_cidr_blocks"></a> [v4\_cidr\_blocks](#input\_v4\_cidr\_blocks) | CIDR блоки для подсети | `list(string)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Use specific availability zone | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_lamp_server"></a> [external\_ip\_address\_lamp\_server](#output\_external\_ip\_address\_lamp\_server) | n/a |
| <a name="output_external_ip_address_lemp_server"></a> [external\_ip\_address\_lemp\_server](#output\_external\_ip\_address\_lemp\_server) | n/a |
| <a name="output_internal_ip_address_lamp_server"></a> [internal\_ip\_address\_lamp\_server](#output\_internal\_ip\_address\_lamp\_server) | n/a |
| <a name="output_internal_ip_address_lemp_server"></a> [internal\_ip\_address\_lemp\_server](#output\_internal\_ip\_address\_lemp\_server) | n/a |
| <a name="output_nlb_ip_load_balancer"></a> [nlb\_ip\_load\_balancer](#output\_nlb\_ip\_load\_balancer) | n/a |
<!-- END_TF_DOCS -->