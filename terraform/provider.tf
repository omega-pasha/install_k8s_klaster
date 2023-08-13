terraform {
  required_providers {
    yandex = {
        source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
    zone = "ru-central1-a"
    service_account_key_file = "key.json"
    cloud_id = ""
    folder_id = ""
}
