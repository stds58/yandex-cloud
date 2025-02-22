resource "yandex_lb_target_group" "target_group" {
  name      = var.target_group_name
  region_id = var.region_id

  dynamic "target" {
    for_each = var.targets
    content {
      subnet_id = target.value.subnet_id
      address   = target.value.address
    }
  }
}

resource "yandex_lb_network_load_balancer" "nlb" {
  name = var.nlb_name

  listener {
    name        = var.listener_name
    port        = var.listener_port
    target_port = var.target_port
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.target_group.id

    healthcheck {
      name = var.healthcheck_name
      http_options {
        port = var.healthcheck_port
        path = var.healthcheck_path
      }
    }
  }
}