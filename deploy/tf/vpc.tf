# deploy/tf/vpc.tf

import {
  to = google_compute_network.vpc
  id = "projects/fiery-celerity-390306/global/networks/planar-sunrise-393211-vpc"
}
import {
  to = google_compute_subnetwork.subnet
  id = "projects/fiery-planar-sunrise-393211/regions/us-central1-c/subnetworks/planar-sunrise-393211-subnet"
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

locals {
  network_name = "${var.project_id}-vpc"
  subnet_name  = "${var.project_id}-subnet"
}

resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
