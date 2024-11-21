###########################
## GCP Windows VM - Main ##
###########################

# Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 4
}

# Bootstrapping Script
# data "template_file" "windows-metadata" {
# template = <<EOF
# # Install IIS
# Install-WindowsFeature -name Web-Server -IncludeManagementTools;
# EOF
# }

# Create Domain Controller VM
resource "google_compute_instance" "vm_instance_public" {
  # name         = "${lower(var.company)}-${lower(var.app_name)}-${var.environment}-vm${random_id.instance_id.hex}"
  name = "lab-dc"
  machine_type = var.windows_instance_type
  zone         = var.gcp_zone
  hostname     = "lab-dc.${var.app_domain}"
  tags         = ["rdp","dc"]

  boot_disk {
    initialize_params {
      image = var.windows_2016_sku
    }
  }

  metadata = {
    sysprep-specialize-script-ps1 = file("scripts/sysprep-specialize.ps1")
  }

  metadata_startup_script = file("scripts/startup-script.ps1")

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.network_subnet.name
    network_ip    = "10.10.15.2"
    access_config { }
  }
} 
