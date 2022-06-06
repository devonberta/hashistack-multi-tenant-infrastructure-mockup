job "j1" {
  datacenters = ["dc1"]

  group "g1" {
    network {
      port "http"{}
      port "ssh"{}
    }
    count = 1
    task "t1-snap-disk" {
      driver = "raw_exec"
      config {
        # When running a binary that exists on the host, the path must be absolute.
        command = "/usr/bin/qemu-img"
        args    = ["create","-b","/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest_v1/testvmimage.qcow2","-f","qcow2","/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest_v1/vm${NOMAD_ALLOC_INDEX}.qcow2"]
        }
      lifecycle {
        hook = "prestart"
        sidecar = false
        }
      }
    task "t2" {
      template {
        data = <<EOH
      Guest System
      EOH

        destination = "local/index.html"
      }
      
      resources {
        cores = 2
        memory = 2048
      }

      service {
        name = "web"
        tags = ["tag1"]
        port = "http"
      }
      service {
        name = "ssh"
        tags = ["tag2"]
        port = "ssh"

      }

      driver = "qemu"

      config {
        image_path= "/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest_v1/vm${NOMAD_ALLOC_INDEX}.qcow2"

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
    task "t3-cleanup-snap-disk" {
      driver = "raw_exec"
      config {
        # When running a binary that exists on the host, the path must be absolute.
        command = "/usr/bin/rm"
        args    = ["-f","/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest_v1/vm${NOMAD_ALLOC_INDEX}.qcow2"]
      }
      lifecycle {
        hook = "poststop"
        sidecar = false
      }
    }
  }
}