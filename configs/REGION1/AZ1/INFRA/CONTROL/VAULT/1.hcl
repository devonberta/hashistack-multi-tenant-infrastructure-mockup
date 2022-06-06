ui = true

listener "tcp" {
  address = "127.0.1.10:8200"
  tls_disable = true
}

api_addr = "http://127.0.1.10:8200"
cluster_addr = "http://127.0.1.10:8201"

storage "raft" {
  path    = "/vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1"
  node_id = "R1-AZ1-INFRA-CONTROL-1"
#  retry_join {
#    leader_api_addr = "http://127.0.2.10:8200"
#  }
#  retry_join {
#    leader_api_addr = "http://127.0.3.10:8200"
#  }
}
