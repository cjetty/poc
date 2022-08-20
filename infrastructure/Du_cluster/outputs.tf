/*
output "vm_instance_1_private" {
  value = google_compute_instance.du_instance_2.network_interface.0.network_ip
}

output "vm_instance_1_public" {
  value = google_compute_instance.du_instance_2.network_interface.0.access_config.0.nat_ip
}
*/