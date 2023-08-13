resource "yandex_vpc_network" "default" {
    name = "k8s-network"
}

resource "yandex_vpc_subnet" "default" {
    name = "k8s-subset"
    zone = "ru-central1-a"
    network_id = yandex_vpc_network.default.id
    v4_cidr_blocks = ["192.168.111.0/24"]
  
}