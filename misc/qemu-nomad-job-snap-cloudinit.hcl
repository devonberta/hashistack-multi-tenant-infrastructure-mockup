job "j1" {
  datacenters = ["dc1"]

  group "g1" {
    network {
      port "http"{}
      port "ssh"{}
    }
    count = 3
    task "t1-snap-disk" {
      driver = "raw_exec"
      config {
        # When running a binary that exists on the host, the path must be absolute.
        command = "/usr/bin/qemu-img"
        args    = ["create","-b","/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest/testvmimage.qcow2","-f","qcow2","/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest/vm${NOMAD_ALLOC_INDEX}.qcow2"]
      }
      lifecycle {
        hook = "prestart"
        sidecar = false
      }
    }
    task "t2-cloud-init-disk" {
      artifact {
        source      = "http://127.0.0.1/user-data.tpl"
        destination = "local/"
      }
      artifact {
        source      = "http://127.0.0.1/meta-data.tpl"
        destination = "local/"
      }
      template {
        source      = "local/user-data.tpl"
        destination = "local/user-data"
        change_mode = "noop"
      }
      template {
        source      = "local/meta-data.tpl"
        destination = "local/meta-data"
        change_mode = "noop"
      }
      driver = "raw_exec"
      config {
        command = "/usr/bin/cloud-localds"
        args    = [
          "/opt/nomad/data/alloc/${NOMAD_ALLOC_ID}/${NOMAD_TASK_NAME}/local/seed.img",
          "/opt/nomad/data/alloc/${NOMAD_ALLOC_ID}/${NOMAD_TASK_NAME}/local/user-data",
          "/opt/nomad/data/alloc/${NOMAD_ALLOC_ID}/${NOMAD_TASK_NAME}/local/meta-data"
        ]
      }
      lifecycle {
        hook = "prestart"
        sidecar = false
      }
    }
    task "t3-pause" {
      driver = "raw_exec"
      config {
        command = "/usr/bin/sleep"
        args    = [
          "5"
        ]
      }
      lifecycle {
        hook = "prestart"
        sidecar = false
      }
    }
    task "t4" {
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
        image_path= "/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest/vm${NOMAD_ALLOC_INDEX}.qcow2"
//        image_path= "/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest/testvmimage.qcow2"

        ## Uncomment if KVM is available on your system
                accelerator = "kvm"

        args = [
          "-device",
          "e1000,netdev=user.0",
          "-netdev",
          "user,id=user.0,hostfwd=tcp::${NOMAD_PORT_http}-:80,hostfwd=tcp::${NOMAD_PORT_ssh}-:22",
          "-drive", 
          "file=/opt/nomad/data/alloc/${NOMAD_ALLOC_ID}/t2-cloud-init-disk/local/seed.img,if=virtio"
        ]
      }
      lifecycle {
        hook = "poststart"
        sidecar = false
      }
    }
    task "t5-cleanup-snap-disk" {
      driver = "raw_exec"
      config {
        # When running a binary that exists on the host, the path must be absolute.
        command = "/usr/bin/rm"
        args    = ["-f","/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest/vm${NOMAD_ALLOC_INDEX}.qcow2"]
      }
      lifecycle {
        hook = "poststop"
        sidecar = false
      }
    }
  }
}