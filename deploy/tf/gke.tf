import {
  to = google_container_cluster.primary
  id = "projects/planar-sunrise-393211/locations/us-central1-c/clusters/henhat-cluster"
}

resource "google_container_cluster" "primary" {
  name             = "henhat-cluster"
  location         = var.region
  network          = google_compute_network.vpc.name
  subnetwork       = google_compute_subnetwork.subnet.name
  enable_autopilot = true
}
