name       = "R1-AZ2-INFRA-CONTROL-1"
ui {
  enabled =  true
}
region     = "R1"
datacenter = "AZ2"
data_dir = "/vagrant/data/REGION1/AZ2/INFRA/CONTROL/NOMAD/1"
bind_addr = "127.0.2.10"
advertise {
  http = "127.0.2.10"
  rpc  = "127.0.2.10"
  serf = "127.0.2.10"
}
server {
  enabled          = true
  bootstrap_expect = 3
  encrypt = "o04ySMDpvZvHS6kVPEFTAHpHPf2A1y+cRoqO6WFUUs4="
#  server_join {
#    retry_join     = [ "127.0.1.10", "127.0.3.10" ]
#    retry_max      = 0
#    retry_interval = "30s"
#  }
}

client {
  enabled       = true
}

consul {
  address             = "127.0.2.10:8500"
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
