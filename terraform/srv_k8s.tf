resource "yandex_compute_instance" "srvmicrok8s" {
  count = 5
  name  = "clasterk8s-${count.index}"
  zone  = "ru-central1-a"
  allow_stopping_for_update = true
  platform_id = "standard-v3"

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8oshj0osht8svg6rfs"
      type     = "network-hdd"
      size     = "30"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}
