job "j1" {
  datacenters = ["dc1"]

  group "g1" {
    task "t1" {
      template {
        data = <<EOH
      Guest System
      EOH

        destination = "local/index.html"
      }

      resources {
        cores = 2
        memory = 2048
        network {
          port "http"{}
          port "ssh"{}
        }
      }

      service {
        name = "web"
        tags = ["tag1"]
        port = "http"

        check {
          type     = "http"
          port     = "http"
          path     = "/index.html"
          interval = "30s"
          timeout  = "5s"
        }
        
        check_restart {
          limit           = 2
          grace           = "60s"
          ignore_warnings = false
        }
      }
      service {
        name = "ssh"
        tags = ["tag2"]
        port = "ssh"

      }

      driver = "qemu"

      config {
        image_path = "/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest_v1/tdhtest.qcow2"

        ## Uncomment if KVM is available on your system
                accelerator = "kvm"

        args = [
          "-device",
          "e1000,netdev=user.0",
          "-netdev",
          "user,id=user.0,hostfwd=tcp::${NOMAD_PORT_http}-:80,hostfwd=tcp::${NOMAD_PORT_ssh}-:22",
          "-drive", 
          "file=fat:rw:/opt/nomad/data/alloc/${NOMAD_ALLOC_ID}/${NOMAD_TASK_NAME}/local,format=raw,media=disk"
        ]
      }
    }
    task "t2" {
      template {
        data = <<EOH
      Guest System
      EOH

        destination = "local/index.html"
      }
      
      artifact {
        source      = "http://127.0.0.1/testvmimage.qcow2"
        destination = "local/testvmimage.qcow2"
        mode        = "file"
      }
      resources {
        cores = 2
        memory = 2048
        network {
          port "http"{}
          port "ssh"{}
        }
      }

      service {
        name = "web"
        tags = ["tag1"]
        port = "http"

        check {
          type     = "http"
          port     = "http"
          path     = "/index.html"
          interval = "30s"
          timeout  = "5s"
        }
        
        check_restart {
          limit           = 2
          grace           = "60s"
          ignore_warnings = false
        }
      }
      service {
        name = "ssh"
        tags = ["tag2"]
        port = "ssh"

      }

      driver = "qemu"

      config {
        image_path = "/opt/nomad/data/alloc/${NOMAD_ALLOC_ID}/${NOMAD_TASK_NAME}/local/testvmimage.qcow2"

        ## Uncomment if KVM is available on your system
                accelerator = "kvm"

        args = [
          "-device",
          "e1000,netdev=user.0",
          "-netdev",
          "user,id=user.0,hostfwd=tcp::${NOMAD_PORT_http}-:80,hostfwd=tcp::${NOMAD_PORT_ssh}-:22",
          "-drive", 
          "file=fat:rw:/opt/nomad/data/alloc/${NOMAD_ALLOC_ID}/${NOMAD_TASK_NAME}/local,format=raw,media=disk"
        ]
      }
    }
  }
}