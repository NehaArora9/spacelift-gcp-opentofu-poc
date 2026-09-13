
resource "google_compute_network" "poc_vpc" {
  name                    = "spacelift-poc-vpcs"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "poc_subnet" {
  name          = "spacelift-poc-subnets"
  ip_cidr_range = "10.11.0.0/24"
  region        = var.region
  network       = google_compute_network.poc_vpc.id

}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.poc_vpc.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["http-server"]
}