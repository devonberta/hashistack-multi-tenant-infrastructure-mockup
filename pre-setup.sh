#!/bin/bash
apt-get install unzip jq

curl -k https://releases.hashicorp.com/consul/1.12.0/consul_1.12.0_linux_amd64.zip --output ~/consul.zip
curl -k https://releases.hashicorp.com/nomad/1.3.1/nomad_1.3.1_linux_amd64.zip --output ~/nomad.zip
curl -k https://releases.hashicorp.com/vault/1.10.3/vault_1.10.3_linux_amd64.zip --output ~/vault.zip
curl -k https://releases.hashicorp.com/terraform/1.2.0/terraform_1.2.0_linux_amd64.zip --output ~/terraform.zip

unzip ~/consul.zip -d /bin/
unzip ~/nomad.zip -d /bin/
unzip ~/vault.zip -d /bin/
unzip ~/terraform.zip -d /bin/

setcap cap_ipc_lock=+ep /bin/vault

add-apt-repository ppa:vbernat/haproxy-1.8 -y
apt-get update
apt-get install haproxy -y
cp /vagrant/configs/haproxy_host/haproxy.cfg /etc/haproxy/haproxy.cfg
systemctl restart haproxy