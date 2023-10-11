#!/bin/bash
## Variables
base_path="/home/grays/Documents/repos/old/hashistack-multi-tenant-infrastructure-mockup/simple-demo"
## Vault Ip address
ip addr add 127.0.1.10 dev lo
route add -host 127.0.1.10 dev lo
## vault data path
mkdir -p ${base_path}/data/vault
vault server -config=${base_path}/configs/vault.hcl &> ${base_path}/data/vault/log.txt & 
echo "sleeping before vault node 1 init and unseal"
sleep 10
VAULT_ADDR="http://127.0.1.10:8200" vault operator init -format=json &> ${base_path}/data/vault/init.json
VAULT_ADDR="http://127.0.1.10:8200" vault status
# Read data from init operator output to unseal the vault instances
VAULT_ADDR="http://127.0.1.10:8200" vault operator unseal `cat ${base_path}/data/vault/init.json | jq -r '.unseal_keys_b64[0]'`
VAULT_ADDR="http://127.0.1.10:8200" vault operator unseal  `cat ${base_path}/data/vault/init.json | jq -r '.unseal_keys_b64[1]'`
VAULT_ADDR="http://127.0.1.10:8200" vault operator unseal  `cat ${base_path}/data/vault/init.json | jq -r '.unseal_keys_b64[2]'`

## 
## Consul Ip address
ip addr add 127.0.1.11 dev lo
route add -host 127.0.1.11 dev lo
## Consul Config
mkdir -p ${base_path}/data/consul/R1
consul agent -config-file=${base_path}/configs/r1-consul.hcl &> ${base_path}/data/consul/R1/log.txt &
## Nomad Config
mkdir -p ${base_path}/data/nomad/R1
nomad agent -config=${base_path}/configs/r1-nomad.hcl &> ${base_path}/data/nomad/R1/log.txt &

## Consul Ip address
ip addr add 127.0.1.12 dev lo
route add -host 127.0.1.12 dev lo
## Consul Config
mkdir -p ${base_path}/data/consul/R2
consul agent -config-file=${base_path}/configs/r2-consul.hcl &> ${base_path}/data/consul/R2/log.txt &
## Nomad Config
mkdir -p ${base_path}/data/nomad/R2
nomad agent -config=${base_path}/configs/r2-nomad.hcl &> ${base_path}/data/nomad/R2/log.txt &

## Consul Ip address
ip addr add 127.0.1.13 dev lo
route add -host 127.0.1.13 dev lo
## Consul Config
mkdir -p ${base_path}/data/consul/R3
consul agent -config-file=${base_path}/configs/r3-consul.hcl &> ${base_path}/data/consul/R3/log.txt &
## Nomad Config
mkdir -p ${base_path}/data/nomad/R3
nomad agent -config=${base_path}/configs/r3-nomad.hcl &> ${base_path}/data/nomad/R3/log.txt &

## start workers
## worker ip
ip addr add 127.0.1.21 dev lo
route add -host 127.0.1.21 dev lo
## Consul Config
mkdir -p ${base_path}/data/consul/R1/worker/1
consul agent -config-file=${base_path}/configs/workers/r1-consul-worker-1.hcl &> ${base_path}/data/consul/R1/worker/1/log.txt &


## Haproxy configuration
cp ${base_path}/configs/haproxy.cfg /etc/haproxy/haproxy.cfg
systemctl restart haproxy