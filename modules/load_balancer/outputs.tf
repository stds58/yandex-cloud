output "nlb_ip" {
  value = [
    for listener in yandex_lb_network_load_balancer.nlb.listener :
    [for address_spec in listener.external_address_spec : address_spec.address][0]
    if length(listener.external_address_spec) > 0
  ][0]
}