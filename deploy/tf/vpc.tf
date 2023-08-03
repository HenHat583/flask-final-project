import {
  to = google_compute_network.vpc
  id = "projects/fiery-celerity-390306/global/networks/fiery-celerity-390306-vpc"
}
import {
  to = google_compute_subnetwork.subnet
  id = "projects/fiery-celerity-390306/regions/us-central1/subnetworks/fiery-celerity-390306-subnet"
}

resource "google_compute_network" "vpc" {
  name = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
