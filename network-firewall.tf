###################################
## Network Firewall Rules - Main ##
###################################

# allow rdp
resource "google_compute_firewall" "allow-rdp" {
  name    = "${var.app_name}-${var.environment}-fw-allow-rdp"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["rdp"]
}
