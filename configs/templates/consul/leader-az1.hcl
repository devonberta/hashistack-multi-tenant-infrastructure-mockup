# Setting the Region to R1 to match the server certificate datacenter value
datacenter = "${region}"
primary_datacenter = "${region}"
# server specific data path value
data_dir = "${base_path}/data/${region}/AZ1/INFRA/CONTROL/CONSUL/1/"
# Just name of server that consul will register as, should be unique in each config when running multiple agents locally
node_name = "${region}-AZ1-INFRA-CONTROL-1"
# set to make this agent a server
server = true
# enable ui
ui_config = {
  enabled = true
}
# addresses to use for various interface settings
advertise_addr = "127.${region-octet}.1.10"
client_addr    = "127.${region-octet}.1.10"
bind_addr      = "127.${region-octet}.1.10"
# used for joining the other hosts to the cluster
retry_join     = ["127.${region-octet}.2.10","127.${region-octet}.3.10"]
# number of servers to expect before bootstrapping the cluster, three servers total
bootstrap_expect = 3
# verify the certificate presented by servers connecting
#verify_incoming = true
# verify the certificate presented by servers connecint too
#verify_outgoing = true
# verify the hostname of server certificates
#verify_server_hostname = true
# certificate authority cert to use for validation of trusted certs
#ca_file = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/ca.crt"
# certificate to be used by the server
#cert_file = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/agent.crt"
# private key of server certificate
#key_file = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/agent.key"
auto_encrypt {
  allow_tls = true
}
encrypt = "aPuGh+5UDskRAbkLaXRzFoSOcSM+5vAK+NEYOWHJH7w="
## Service mesh CA configuration
connect {
  enabled = true
  ca_provider = "vault"
    ca_config {
        address = "http://127.0.1.10:8200"
        token = "consul-ca-vault-token"
        root_pki_path = "connect_root"
        intermediate_pki_path = "connect_inter"
        leaf_cert_ttl = "72h"
        rotation_period = "2160h"
        intermediate_cert_ttl = "8760h"
        private_key_type = "rsa"
        private_key_bits = 2048
    }
}

ports {
  https = 8501
  grpc  = 8502
}

acl { 
  enabled = true
  default_policy = "allow"
  enable_token_persistence = true
  tokens {
    initial_management = "e95b599e-166e-7d80-08ad-aee76e7ddf19",
    agent = "e95b599e-166e-7d80-08ad-aee76e7ddf19"
    }
}

tls {
  defaults {
    ca_file = "${base_path}/data/${region}/AZ1/INFRA/CONTROL/CONSUL/ca.crt"
    cert_file = "${base_path}/data/${region}/AZ1/INFRA/CONTROL/CONSUL/agent.crt"
    key_file = "${base_path}/data/${region}/AZ1/INFRA/CONTROL/CONSUL/agent.key"
    verify_incoming = true
    verify_outgoing = true
  }
  internal_rpc {
    verify_server_hostname = true
  }
}