ui = true

listener "tcp" {
  address = "127.${region-octet}.2.10:8200"
  tls_disable = true
}

api_addr = "http://127.${region-octet}.2.10:8200"
cluster_addr = "http://127.${region-octet}.2.10:8201"

storage "raft" {
  path    = "${base_path}/data/${region}/AZ2/INFRA/CONTROL/VAULT/1"
  node_id = "${region}-AZ2-INFRA-CONTROL-1"
  retry_join {
    leader_api_addr = "http://127.${region-octet}.1.10:8200"
  }
  retry_join {
    leader_api_addr = "http://127.${region-octet}.3.10:8200"
  }
}
