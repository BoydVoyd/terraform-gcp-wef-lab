#############################
## GCP Windows VM - Output ##
#############################

output "dc-name" {
  value = google_compute_instance.vm_instance_dc.name
}

output "dc-external-ip" {
  value = google_compute_instance.vm_instance_dc.network_interface.0.access_config.0.nat_ip
}

output "dc-internal-ip" {
  value = google_compute_instance.vm_instance_dc.network_interface.0.network_ip
}

output "wec-name" {
  value = google_compute_instance.vm_instance_wec.name
}

output "wec-external-ip" {
  value = google_compute_instance.vm_instance_wec.network_interface.0.access_config.0.nat_ip
}

output "wec-internal-ip" {
  value = google_compute_instance.vm_instance_wec.network_interface.0.network_ip
}

output "test-name" {
  value = google_compute_instance.vm_instance_test.name
}

output "test-external-ip" {
  value = google_compute_instance.vm_instance_test.network_interface.0.access_config.0.nat_ip
}

output "test-internal-ip" {
  value = google_compute_instance.vm_instance_test.network_interface.0.network_ip
}
