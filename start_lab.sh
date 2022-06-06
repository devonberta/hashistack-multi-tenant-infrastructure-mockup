#!/bin/bash
# kill any existing processes before starting
pkill -f nomad
pkill -f consul
pkill -f vault

# Adding ip addresses used in the lab environment
### Region 1 ###
## Availability Zone 1 ##
# R1-AZ1-INFRA-CONTROL-1
ip addr add 127.0.1.10 dev lo
route add -host 127.0.1.10 dev lo
# R1-AZ1-INFRA-HOST-1
ip addr add 127.0.1.11 dev lo
route add -host 127.0.1.11 dev lo
# R1-AZ1-INFRA-HOST-2
ip addr add 127.0.1.12 dev lo
route add -host 127.0.1.12 dev lo
# R1-AZ1-INFRA-HOST-3
ip addr add 127.0.1.13 dev lo
route add -host 127.0.1.13 dev lo
# R1-AZ1-INFRA-WORKER-1
ip addr add 127.0.1.21 dev lo
route add -host 127.0.1.21 dev lo
# R1-AZ1-INFRA-WORKER-2
ip addr add 127.0.1.22 dev lo
route add -host 127.0.1.22 dev lo
# R1-AZ1-INFRA-WORKER-3
ip addr add 127.0.1.23 dev lo
route add -host 127.0.1.23 dev lo
# R1-AZ1-SERVICE-WORKER-1
ip addr add 127.0.1.31 dev lo
route add -host 127.0.1.31 dev lo
# R1-AZ1-SERVICE-WORKER-2
ip addr add 127.0.1.32 dev lo
route add -host 127.0.1.32 dev lo
# R1-AZ1-SERVICE-WORKER-3
ip addr add 127.0.1.33 dev lo
route add -host 127.0.1.33 dev lo
# R1-AZ1-SERVICE-CONTROL-1
ip addr add 127.0.1.41 dev lo
route add -host 127.0.1.41 dev lo
# R1-AZ1-SERVICE-CONTROL-2
ip addr add 127.0.1.42 dev lo
route add -host 127.0.1.42 dev lo
# R1-AZ1-SERVICE-CONTROL-3
ip addr add 127.0.1.43 dev lo
route add -host 127.0.1.43 dev lo


## Availability Zone 2 ##
# AZ2-INFRA-CONTROL-1
ip addr add 127.0.2.10 dev lo
route add -host 127.0.2.10 dev lo
# AZ2-INFRA-HOST-1
ip addr add 127.0.2.11 dev lo
route add -host 127.0.2.11 dev lo
# AZ2-INFRA-HOST-2
ip addr add 127.0.2.12 dev lo
route add -host 127.0.2.12 dev lo
# AZ2-INFRA-HOST-3
ip addr add 127.0.2.13 dev lo
route add -host 127.0.2.13 dev lo
# AZ2-INFRA-WORKER-1
ip addr add 127.0.2.21 dev lo
route add -host 127.0.2.21 dev lo
# AZ2-INFRA-WORKER-2
ip addr add 127.0.2.22 dev lo
route add -host 127.0.2.22 dev lo
# AZ2-INFRA-WORKER-3
ip addr add 127.0.2.23 dev lo
route add -host 127.0.2.23 dev lo
# AZ2-SERVICE-WORKER-1
ip addr add 127.0.2.31 dev lo
route add -host 127.0.2.31 dev lo
# AZ2-SERVICE-WORKER-2
ip addr add 127.0.2.32 dev lo
route add -host 127.0.2.32 dev lo
# AZ2-SERVICE-WORKER-3
ip addr add 127.0.2.33 dev lo
route add -host 127.0.2.33 dev lo
# AZ2-SERVICE-CONTROL-1
ip addr add 127.0.2.41 dev lo
route add -host 127.0.2.41 dev lo
# AZ2-SERVICE-CONTROL-2
ip addr add 127.0.2.42 dev lo
route add -host 127.0.2.42 dev lo
# AZ2-SERVICE-CONTROL-3
ip addr add 127.0.2.43 dev lo
route add -host 127.0.2.43 dev lo

## Availability Zone 3 ##
# AZ3-INFRA-CONTROL-1
ip addr add 127.0.3.10 dev lo
route add -host 127.0.3.10 dev lo
# AZ3-INFRA-HOST-1
ip addr add 127.0.3.11 dev lo
route add -host 127.0.3.11 dev lo
# AZ3-INFRA-HOST-2
ip addr add 127.0.3.12 dev lo
route add -host 127.0.3.12 dev lo
# AZ3-INFRA-HOST-3
ip addr add 127.0.3.13 dev lo
route add -host 127.0.3.13 dev lo
# AZ3-INFRA-WORKER-1
ip addr add 127.0.3.21 dev lo
route add -host 127.0.3.21 dev lo
# AZ3-INFRA-WORKER-2
ip addr add 127.0.3.22 dev lo
route add -host 127.0.3.22 dev lo
# AZ3-INFRA-WORKER-3
ip addr add 127.0.3.23 dev lo
route add -host 127.0.3.23 dev lo
# AZ3-SERVICE-WORKER-1
ip addr add 127.0.3.31 dev lo
route add -host 127.0.3.31 dev lo
# AZ3-SERVICE-WORKER-2
ip addr add 127.0.3.32 dev lo
route add -host 127.0.3.32 dev lo
# AZ3-SERVICE-WORKER-3
ip addr add 127.0.3.33 dev lo
route add -host 127.0.3.33 dev lo
# AZ3-SERVICE-CONTROL-1
ip addr add 127.0.3.41 dev lo
route add -host 127.0.3.41 dev lo
# AZ3-SERVICE-CONTROL-2
ip addr add 127.0.3.42 dev lo
route add -host 127.0.3.42 dev lo
# AZ3-SERVICE-CONTROL-3
ip addr add 127.0.3.43 dev lo
route add -host 127.0.3.43 dev lo

# delete data path
rm -rf /vagrant/data/*

# recreate data path folders
### REGION1 ###
## Availability Zone 1 ##
# Control Nodes #
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/CONTROL/NOMAD/1
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/1
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1
# Host Nodes #
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/HOST/NOMAD/1
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/HOST/CONSUL/1
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/HOST/VAULT/1
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/HOST/NOMAD/2
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/HOST/CONSUL/2
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/HOST/VAULT/2
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/HOST/NOMAD/3
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/HOST/CONSUL/3
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/HOST/VAULT/3
# Worker Nodes #
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/WORKER/NOMAD/1
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/WORKER/CONSUL/1
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/WORKER/VAULT/1
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/WORKER/NOMAD/2
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/WORKER/CONSUL/2
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/WORKER/VAULT/2
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/WORKER/NOMAD/3
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/WORKER/CONSUL/3
mkdir -p /vagrant/data/REGION1/AZ1/INFRA/WORKER/VAULT/3

## Availability Zone 2 ##
# Control Nodes #
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/CONTROL/NOMAD/1
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/CONTROL/CONSUL/1
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/CONTROL/VAULT/1
# Host Nodes #
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/HOST/NOMAD/1
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/HOST/CONSUL/1
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/HOST/VAULT/1
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/HOST/NOMAD/2
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/HOST/CONSUL/2
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/HOST/VAULT/2
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/HOST/NOMAD/3
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/HOST/CONSUL/3
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/HOST/VAULT/3
# Worker Nodes #
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/WORKER/NOMAD/1
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/WORKER/CONSUL/1
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/WORKER/VAULT/1
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/WORKER/NOMAD/2
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/WORKER/CONSUL/2
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/WORKER/VAULT/2
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/WORKER/NOMAD/3
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/WORKER/CONSUL/3
mkdir -p /vagrant/data/REGION1/AZ2/INFRA/WORKER/VAULT/3

## Availability Zone 3 ##
# Control Nodes #
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/CONTROL/NOMAD/1
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/CONTROL/CONSUL/1
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/CONTROL/VAULT/1
# Host Nodes #
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/HOST/NOMAD/1
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/HOST/CONSUL/1
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/HOST/VAULT/1
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/HOST/NOMAD/2
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/HOST/CONSUL/2
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/HOST/VAULT/2
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/HOST/NOMAD/3
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/HOST/CONSUL/3
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/HOST/VAULT/3
# Worker Nodes #
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/WORKER/NOMAD/1
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/WORKER/CONSUL/1
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/WORKER/VAULT/1
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/WORKER/NOMAD/2
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/WORKER/CONSUL/2
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/WORKER/VAULT/2
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/WORKER/NOMAD/3
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/WORKER/CONSUL/3
mkdir -p /vagrant/data/REGION1/AZ3/INFRA/WORKER/VAULT/3

# starting Region 1 infra control vault servers
vault server -config=/vagrant/configs/REGION1/AZ1/INFRA/CONTROL/VAULT/1.hcl &> /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/log.txt & 
echo "sleeping before vault node 1 init and unseal"
sleep 10
VAULT_ADDR="http://127.0.1.10:8200" vault operator init -format=json &> /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json
VAULT_ADDR="http://127.0.1.10:8200" vault status
# Read data from init operator output to unseal the vault instances
VAULT_ADDR="http://127.0.1.10:8200" vault operator unseal `cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.unseal_keys_b64[0]'`
VAULT_ADDR="http://127.0.1.10:8200" vault operator unseal  `cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.unseal_keys_b64[1]'`
VAULT_ADDR="http://127.0.1.10:8200" vault operator unseal  `cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.unseal_keys_b64[2]'`
# Starting the other two servers in the second and third Availability zone
vault server -config=/vagrant/configs/REGION1/AZ2/INFRA/CONTROL/VAULT/1.hcl &> /vagrant/data/REGION1/AZ2/INFRA/CONTROL/VAULT/1/log.txt & 
vault server -config=/vagrant/configs/REGION1/AZ3/INFRA/CONTROL/VAULT/1.hcl &> /vagrant/data/REGION1/AZ3/INFRA/CONTROL/VAULT/1/log.txt & 
# waiting so that the servers have enough time to finish starting up and perform the initial cluster synchronization from the leader
echo "sleeping before vault node 2 unseal"
sleep 10
VAULT_ADDR="http://127.0.2.10:8200" vault operator unseal `cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.unseal_keys_b64[0]'`
VAULT_ADDR="http://127.0.2.10:8200" vault operator unseal  `cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.unseal_keys_b64[1]'`
VAULT_ADDR="http://127.0.2.10:8200" vault operator unseal  `cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.unseal_keys_b64[2]'`
echo "sleeping before vault node 3 unseal"
sleep 10
VAULT_ADDR="http://127.0.3.10:8200" vault operator unseal `cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.unseal_keys_b64[0]'`
VAULT_ADDR="http://127.0.3.10:8200" vault operator unseal  `cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.unseal_keys_b64[1]'`
VAULT_ADDR="http://127.0.3.10:8200" vault operator unseal  `cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.unseal_keys_b64[2]'`

#cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq '.root_token'
VAULT_ADDR="http://127.0.1.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault operator raft list-peers

# Things to do:
## generate consul connect ca on ca secrets engine in vault
# import policy to allow consul to generate certificate authority configuration
VAULT_ADDR="http://127.0.2.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault policy write connect-ca /vagrant/configs/REGION1/AZ1/INFRA/CONTROL/VAULT/consul-ca-policy.hcl
# create vault token with policy for consul to use to generate ca and sign certificates
VAULT_ADDR="http://127.0.2.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault token create -policy=connect-ca -orphan -format=json &> /vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/1/token.json
# copy config before updating it with vault token
cp /vagrant/configs/REGION1/AZ1/INFRA/CONTROL/CONSUL/1.hcl /vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/1/config.hcl
# replace vault token in config placeholder with generated token value
sed -i "s/consul-ca-vault-token/$(cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/1/token.json | jq -r '.auth.client_token')/" /vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/1/config.hcl
## setup consul servers with vault ca and auto config settings
# https://learn.hashicorp.com/tutorials/consul/vault-pki-consul-secure-tls Use this to generate ca certificate for consul ahead of time
# configure root ca pki engine
VAULT_ADDR="http://127.0.2.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault secrets enable -path=root_consul_ca pki
# Generate root ca certificate
VAULT_ADDR="http://127.0.2.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault write -field=certificate root_consul_ca/root/generate/internal common_name="root_consul_ca.consul" ttl=87600h > /vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/CA_cert.crt
# configure root ca crl and aia
VAULT_ADDR="http://127.0.2.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault write root_consul_ca/config/urls issuing_certificates="http://127.0.2.10:8200/v1/root_consul_ca/ca" crl_distribution_points="http://127.0.2.10:8200/v1/root_consul_ca/crl"
# Configure intermediate ca pki engine
VAULT_ADDR="http://127.0.2.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault secrets enable -path=int_consul_ca pki
# Generate intermediate ca certificate
VAULT_ADDR="http://127.0.2.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault write -format=json int_consul_ca/intermediate/generate/internal common_name="int_consul_ca.consul Intermediate Authority" | jq -r '.data.csr' > /vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/Int_cert.csr
# Sign intermediate ca certificate with root ca certificate
VAULT_ADDR="http://127.0.2.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault write -format=json root_consul_ca/root/sign-intermediate csr=@/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/Int_cert.csr format=pem_bundle | jq -r '.data.certificate' > @/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/intermediate.cert.pem
# Import signed intermediate certificage back into vault
VAULT_ADDR="http://127.0.2.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault write int_consul_ca/intermediate/set-signed certificate=@/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/intermediate.cert.pem
# Create role for generating server certificates for consul
VAULT_ADDR="http://127.0.2.10:8200" VAULT_TOKEN=`cat /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/init.json | jq -r '.root_token'` vault write int_consul_ca/roles/consul-dc1 allowed_domains="R1.consul" allow_subdomains=true generate_lease=true max_ttl="720h"

# generate server ca certificates

# https://learn.hashicorp.com/tutorials/consul/docker-compose-auto-config?in=consul/security use this to configure auto config for servers and just provide jwt to them for gossip key, tls cert, and other config values

# start consul servers with gossip key and ca certificate generated by vault for tls communication

## Setup Nomad Cluster
# starting Region 1 infra control nomad servers
nomad agent -config=/vagrant/configs/REGION1/AZ1/INFRA/CONTROL/NOMAD/1.hcl &> /vagrant/data/REGION1/AZ1/INFRA/CONTROL/NOMAD/1/log.txt &
nomad agent -config=/vagrant/configs/REGION1/AZ2/INFRA/CONTROL/NOMAD/1.hcl &> /vagrant/data/REGION1/AZ2/INFRA/CONTROL/NOMAD/1/log.txt &
nomad agent -config=/vagrant/configs/REGION1/AZ3/INFRA/CONTROL/NOMAD/1.hcl &> /vagrant/data/REGION1/AZ3/INFRA/CONTROL/NOMAD/1/log.txt &

# Check Region 1 control nomad cluster member status
sleep 10
NOMAD_ADDR="http://127.0.3.10:4646" nomad server members

## setup acl on nomad
## generate vault nomad intergraiton
## setup consul vault intergration
## setup vault agent configuration to template nomad client and consul client configs with vault tokens for IH and IW
# generate jwt for consul agents
## start IH and IW hosts
## check IH and IW hosts register to consul and nomad as expected
## write job spec for service control plane instances of vault, nomad, and consul
## write job spec for service worker instances with vault agent, nomad, and consul
## submit service control plane jobs to IH hosts
## submit service worker instance job to IW hosts
## submit docker job to Service nomad control plan using consul and vault to get secrets with terraform
## validate job accessibility and mapping to loopback ip address
## spin up second region
## federate infra control plane
## create new job to deploy to multiple regions active active
## create new job to deploy to multiple regions active passive
## create new job to deploy to multiple regions active failover

