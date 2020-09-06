resource "google_compute_firewall" "allow-k3s" {
  name    = "allow-k3s"
  network = "${google_compute_network.k3s-net.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "6443"]
  }
  allow {
    protocol = "udp"
    ports    = ["8472"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["k3s"]
}
