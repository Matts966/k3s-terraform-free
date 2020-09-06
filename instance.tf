resource "google_compute_address" "k3s" {
  name   = "k3s"
  region = var.region
}


resource "google_compute_instance" "k3s" {
  name         = "k3s"
  machine_type = "f1-micro"
  zone         = var.region_zone
  tags         = ["k3s"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size  = "30"
      type  = "pd-standard"
    }
  }

  metadata_startup_script = <<EOT
timedatectl set-timezone Asia/Tokyo
EOT

  network_interface {
    subnetwork = google_compute_subnetwork.subnet1.name
    access_config {
      nat_ip = google_compute_address.k3s.address
    }
  }

  metadata = {
     "block-project-ssh-keys" = "true"
     "ssh-keys" = "k3s:${file("~/.ssh/id_rsa.pub")}"
    }
}
