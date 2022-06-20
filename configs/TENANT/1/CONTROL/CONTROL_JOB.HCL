# need to adjust the paths in vagrant for this to work for tenant
# also need to adjust nomad region from r1 to region1 or adjust all file paths from region 1 to r1 in configs
# doing this to templatize the job specification and will make sense when deploying a second or third region job
# or can just write a template file and template from it to inject the correct values. That maybe easier then
# redoing all the templates and accomplish the same thing

job "VAULT" {
  datacenters = ["AZ1"]

  group "g1" {
    network {
      port "http"{}
      port "ssh"{}
    }
    count = 1
    task "start_vault" {
      driver = "raw_exec"
      config {
        # When running a binary that exists on the host, the path must be absolute.
        command = "/bin/vault"
        #vault server -config=/vagrant/configs/REGION1/AZ1/INFRA/CONTROL/VAULT/1.hcl &> /vagrant/data/REGION1/AZ1/INFRA/CONTROL/VAULT/1/log.txt
        args    = ["-config=/vagrant/configs/${NOMAD_REGION}/${NOMAD_DC}/TENANT/${var.tenant_id}/CONTROL/VAULT/${NOMAD_ALLOC_INDEX}.hcl","&>","/vagrant/data/${NOMAD_REGION}/${NOMAD_DC}/TENANT/CONTROL/VAULT/${NOMAD_ALLOC_INDEX}/log.txt"]
      }
      lifecycle {
        hook = "prestart"
        sidecar = false
      }
    }
  }
}