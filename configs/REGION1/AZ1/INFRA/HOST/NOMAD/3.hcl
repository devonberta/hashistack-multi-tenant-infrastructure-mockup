name       = "R1-AZ1-INFRA-HOST-3"
region     = "R1"
datacenter = "AZ1"
data_dir = "/vagrant/data/REGION1/AZ1/INFRA/HOST/NOMAD/3"
bind_addr = "127.0.1.13"
advertise {
  http = "127.0.1.13"
  rpc  = "127.0.1.13"
  serf = "127.0.1.13"
}

client {
  enabled       = true
}

consul {
  address             = "127.0.1.13:8500"
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
