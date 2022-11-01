variable "machine_type" {
    type = string
}

variable "zone" {
    type = string
}

###########  Load Balancer   #############
resource "google_compute_instance" "balancer" {
    name = "balancer"
    machine_type = var.machine_type
    zone = var.zone

    boot_disk {
        initialize_params {
          # image list can be found at:
          # https://cloud.google.com/compute/docs/images
          image = "ubuntu-2004-focal-v20221015"
        }
    }

    network_interface {
      network = "default"
      access_config {
      }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }

  tags = ["balancer"]
}
