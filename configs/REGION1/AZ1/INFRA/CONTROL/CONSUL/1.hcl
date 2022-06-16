# Setting the Region to R1 to match the server certificate datacenter value
datacenter = "R1"
# server specific data path value
data_dir = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/1/"
# Just name of server that consul will register as, should be unique in each config when running multiple agents locally
node_name = "R1-AZ1-INFRA-CONTROL-1"
# set to make this agent a server
server = true
# addresses to use for various interface settings
advertise_addr = "127.0.1.10"
client_addr    = "127.0.1.10"
bind_addr      = "127.0.1.10"
# used for joining the other hosts to the cluster
retry_join     = ["127.0.2.10","127.0.3.10"]
# number of servers to expect before bootstrapping the cluster, three servers total
bootstrap_expect = 3
# verify the certificate presented by servers connecting
verify_incoming = true
# verify the certificate presented by servers connecint too
verify_outgoing = true
# verify the hostname of server certificates
verify_server_hostname = true
# certificate authority cert to use for validation of trusted certs
ca_file = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/ca.crt"
# certificate to be used by the server
cert_file = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/agent.crt"
# private key of server certificate
key_file = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/agent.key"
#auto_encrypt {
#  allow_tls = true
#}

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

auto_config {
  authorization {
    enabled = true
    static {
      oidc_discovery_url = "http://127.0.1.10:8200/v1/identity/oidc"
      bound_issuer = "http://127.0.1.10:8200/v1/identity/oidc",
      bound_audiences = ["R1-AZ1-INFRA-CONTROL-CONSUL"],
      claim_mappings {
        "/consul/hostname" = "node_name"
      }
      claim_assertions = [ 
        "value.node_name == \"${node}\"" 
      ]      
    }
  }
}

ports {
  https = 8501
  grpc  = 8502
}