import {
  to = google_container_cluster.primary
  id = "projects/planar-sunrise-393211/locations/us-central1/clusters/henhat-cluster"
}

resource "google_container_cluster" "primary" {
  name             = "henhat-cluster"
  location         = var.region
  enable_autopilot = true
}
