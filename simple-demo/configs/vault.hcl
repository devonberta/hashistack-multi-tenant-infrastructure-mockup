ui = true

listener "tcp" {
  address = "127.0.1.10:8200"
  tls_disable = true
}

api_addr = "http://127.0.1.10:8200"
cluster_addr = "http://127.0.1.10:8201"

storage "raft" {
  path    = "/home/grays/Documents/repos/old/hashistack-multi-tenant-infrastructure-mockup/simple-demo/data/vault"
  node_id = "R1-vault"
}
