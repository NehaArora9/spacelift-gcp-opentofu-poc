# Triggering Spacelift deployment test
resource "google_compute_network" "poc_vpc" {
  name                    = "spacelift-poc-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "poc_subnet" {
  name          = "spacelift-poc-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.poc_vpc.id
 
}