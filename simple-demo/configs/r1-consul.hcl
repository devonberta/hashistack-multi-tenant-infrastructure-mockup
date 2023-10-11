# Setting the Region to R1 to match the server certificate datacenter value
datacenter = "R1"
primary_datacenter = "R1"
# server specific data path value
data_dir = "/home/grays/Documents/repos/old/hashistack-multi-tenant-infrastructure-mockup/simple-demo/data/consul/R1/"
# Just name of server that consul will register as, should be unique in each config when running multiple agents locally
node_name = "R1-nomad-consul-server"
# set to make this agent a server
server = true
# enable ui
ui_config = {
  enabled = true
}
# addresses to use for various interface settings
advertise_addr = "127.0.1.11"
client_addr    = "127.0.1.11"
bind_addr      = "127.0.1.11"
# number of servers to expect before bootstrapping the cluster, three servers total
bootstrap_expect = 1
# auto encrypt for gossip traffic
auto_encrypt {
  allow_tls = true
}
encrypt = "aPuGh+5UDskRAbkLaXRzFoSOcSM+5vAK+NEYOWHJH7w="
## Service mesh CA configuration
connect {
  enabled = true
#  ca_provider = "vault"
#    ca_config {
#        address = "http://127.0.1.10:8200"
#        token = "consul-ca-vault-token"
#        root_pki_path = "connect_root"
#        intermediate_pki_path = "connect_inter"
#        leaf_cert_ttl = "72h"
#        rotation_period = "2160h"
#        intermediate_cert_ttl = "8760h"
#        private_key_type = "rsa"
#        private_key_bits = 2048
#    }
}

ports {
  https = 8501
  grpc  = 8502
}

#acl { 
#  enabled = true
#  default_policy = "allow"
#  enable_token_persistence = true
#  tokens {
#    initial_management = "e95b599e-166e-7d80-08ad-aee76e7ddf19",
#    agent = "e95b599e-166e-7d80-08ad-aee76e7ddf19"
#    }
#}

#tls {
#  defaults {
#    ca_file = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/ca.crt"
#    cert_file = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/agent.crt"
#    key_file = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/CONSUL/agent.key"
#    verify_incoming = true
#    verify_outgoing = true
#  }
#  internal_rpc {
#    verify_server_hostname = true
#  }
#}