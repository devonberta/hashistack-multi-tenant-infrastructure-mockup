name       = "R3-nomad-consul-server"
ui {
  enabled =  true
}
region     = "R3"
datacenter = "AZ1"
data_dir = "/home/grays/Documents/repos/old/hashistack-multi-tenant-infrastructure-mockup/simple-demo/data/nomad/R3"
bind_addr = "127.0.1.13"
advertise {
  http = "127.0.1.13"
  rpc  = "127.0.1.13"
  serf = "127.0.1.13"
}
server {
  enabled          = true
  bootstrap_expect = 1
  encrypt = "o04ySMDpvZvHS6kVPEFTAHpHPf2A1y+cRoqO6WFUUs4="
  server_join {
    retry_join     = [ "127.0.1.11" ]
    retry_max      = 0
    retry_interval = "30s"
  }
}

client {
  enabled       = true
}

consul {
  address             = "127.0.1.13:8500"
  server_service_name = "nomad"
  client_service_name = "nomad-client"
  auto_advertise      = true
  server_auto_join    = true
  client_auto_join    = true
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}
