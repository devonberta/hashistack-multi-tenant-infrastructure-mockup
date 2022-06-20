name       = "R1-AZ3-INFRA-WORKER-1"
region     = "R1"
datacenter = "AZ3"
data_dir = "/vagrant/data/REGION1/AZ3/INFRA/WORKER/NOMAD/1"
bind_addr = "127.0.3.21"
advertise {
  http = "127.0.3.21"
  rpc  = "127.0.3.21"
  serf = "127.0.3.21"
}

client {
  enabled       = true
  meta {
    role = "IW"
  }
}

consul {
  address             = "127.0.3.21:8500"
  server_service_name = "nomad"
  client_service_name = "nomad-client"
  auto_advertise      = true
#  server_auto_join    = true
  client_auto_join    = true
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}
