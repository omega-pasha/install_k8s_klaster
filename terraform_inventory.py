#!/usr/bin/env python3

import os
import subprocess
import json

def run_terraform_apply():
    os.chdir("/Users/pavelpomorcev/Learning/DevOps/Terraform/microk8s_on_yc/terraform")
    subprocess.run(["terraform", "apply", "-auto-approve"], check=True)

def get_external_ip_addres():
    os.chdir("/Users/pavelpomorcev/Learning/DevOps/Terraform/microk8s_on_yc/terraform")
    terraform_output = subprocess.check_output(["terraform", "output", "-json"]).decode("utf-8")
    parsed_output = json.loads(terraform_output)
    external_ip_address_k8s = parsed_output["external_ip_address_k8s"]["value"]
    return external_ip_address_k8s

def generate_inventory_file(ip_address):
    inventory = {
        "k8s_cluster": {
            "hosts": [ip_address],
            "vars": {}  
        },
        "_meta": {
            "hostvars": {}
        }
    }

    with open("/Users/pavelpomorcev/Learning/DevOps/Terraform/microk8s_on_yc/ansible/hosts", "w") as f:
        json.dump(inventory, f)

if __name__ == "__main__":
    run_terraform_apply()
    external_ip_address = get_external_ip_addres()
    generate_inventory_file(external_ip_address)