output "external_ip_address_k8s" {
  value = yandex_compute_instance.srvmicrok8s.*.network_interface.0.nat_ip_address
}