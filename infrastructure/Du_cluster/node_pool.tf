
data "google_service_account" "myaccount" {
  account_id = 109402732172484769374
}

resource "google_container_node_pool" "du-node-pool" {
  name       = "du-node-pool"
  cluster    = google_container_cluster.du-cluster.id
  node_count = 3

  node_config {
    preemptible  = true
    image_type = "UBUNTU_CONTAINERD"
    machine_type = "e2-medium"
    service_account = data.google_service_account.myaccount.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}