resource "google_container_cluster" "du-cluster" {
  name               = "du-cluster"
  network            = "default"
  location           = var.zone
  remove_default_node_pool = true
  initial_node_count = 1
}



#data "google_compute_image" "my_image" {
#  project = "du-poc"
#  name    = "du-instance"
#}

/*

resource "google_compute_firewall" "compute_ssh" {
  name    = "compute-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["externalssh"]
}





resource "google_compute_instance" "du_instance" {
  name         = "du-nstance-1"
  machine_type = var.du_instance_type

  boot_disk {
    initialize_params {
      #image = data.google_compute_image.my_image.self_link
      image = var.du_instance_image
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }

  depends_on = [google_compute_firewall.compute_ssh]

  metadata = {
    ssh-keys              = file("C:\\Users\\JET73937\\.ssh\\gcp_public_key.pub")
    startup-script        = file(var.user_data)
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "du-terraform@du-poc.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance" "du_instance_2" {
  name         = "du-instance-2"
  machine_type = var.du_instance_type

  boot_disk {
    initialize_params {
      #image = data.google_compute_image.my_image.self_link
      image = var.du_instance_image
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
  #provisioner "remote-exec" {
  #  inline = [
  #    "touch /tmp/temp.txt",
  #  ]
  #}

  # Ensure firewall rule is provisioned before server, so that SSH doesn't fail.
  depends_on = [google_compute_firewall.compute_ssh]

  metadata = {
    ssh-keys              = file("C:\\Users\\JET73937\\.ssh\\gcp_public_key.pub")
    startup-script        = file(var.user_data)
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "du-terraform@du-poc.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
*/