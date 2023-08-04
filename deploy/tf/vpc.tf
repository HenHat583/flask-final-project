import {
  to = google_compute_network.vpc
  id = "projects/planar-sunrise-393211/global/networks/planar-sunrise-393211-vpc"
}

provider "google" {
  credentials = file("${path.cwd}/cred.json")
  project     = var.project_id
  region      = var.region
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
  name                    = local.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = local.subnet_name
  region        = var.region
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = "10.10.0.0/24"
}

# Other resources, if any...
