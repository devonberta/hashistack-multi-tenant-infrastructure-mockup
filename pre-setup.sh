#!/bin/bash
consul_version="1.12.0"
vault_verison="1.10.3"
nomad_version="1.3.1"
terraform_version="1.2.0"
base_path="`pwd`"
temp_path="${base_path}/temp"

system_os=$(uname)
if [[ $system_os == Linux ]]; then
    os="linux"
    apt-get update
    apt-get install unzip jq net-tools -y
elif [[ $system_os == darwin ]]; then
    os="darwin"
    brew install jq
fi

system_arch=$(uname -i)
if [[ $system_arch == x86_64* ]] || [[ $system_arch == i*86 ]]; then
    arch="amd64"
elif  [[ $system_arch == arm* ]] || [[ $system_arch = aarch64 ]]; then
    arch="arm64"
fi

mkdir -p ${temp_path}
curl -k https://releases.hashicorp.com/consul/${consul_version}/consul_${consul_version}_${os}_${arch}.zip --output ${temp_path}/consul.zip
curl -k https://releases.hashicorp.com/nomad/${nomad_version}/nomad_${nomad_version}_${os}_${arch}.zip --output ${temp_path}/nomad.zip
curl -k https://releases.hashicorp.com/vault/${vault_verison}/vault_${vault_verison}_${os}_${arch}.zip --output ${temp_path}/vault.zip
curl -k https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_${os}_${arch}.zip --output ${temp_path}/terraform.zip

unzip ${temp_path}/consul.zip -d /bin/
unzip ${temp_path}/nomad.zip -d /bin/
unzip ${temp_path}/vault.zip -d /bin/
unzip ${temp_path}/terraform.zip -d /bin/

setcap cap_ipc_lock=+ep /bin/vault

add-apt-repository ppa:vbernat/haproxy-1.8 -y
apt-get update
apt-get install haproxy -y
cp ${base_path}/configs/haproxy_host/haproxy.cfg /etc/haproxy/haproxy.cfg
systemctl restart haproxy