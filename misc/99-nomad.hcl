plugin_dir = "/opt/nomad/data/plugins"

plugin "nomad-driver-podman" {
    config {
        socket_path = "unix://run/podman/podman.sock"
    }
}

plugin "qemu" {
  config {
    image_paths = [
        "/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest/",
        "/home/grays/Documents/repos/nomad-lab/output_centos_tdhtest_v1/"
    ]
  }
}


plugin "raw_exec" {
  config {
    enabled = true
  }
}