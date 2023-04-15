resource "google_service_account" "kubernetes" {
    account_id = "kubernetes"
  
}

resource "google_container_node_pool" "workers" {
  name = "workers"
  cluster = google_container_cluster.primary.id

  autoscaling {
    min_node_count = 0
    max_node_count = 10

  }
  node_config {
    preemptible = false
    machine_type = "e2-medium"

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [ "https://www.googleapis.com/auth/cloud-platform" ]

  }
}