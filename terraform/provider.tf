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
    cloud_id = "b1g8dacglmlq7d7hed97"
    folder_id = "b1glodb3fcb408dgl593"
}