# Application Definition 
company     = "boydco"
app_name    = "wef-lab"
app_domain  = "boydvoyd.com"
environment = "dev" # Dev, Test, Prod, etc

# GCP Settings
gcp_project   = "wef-lab"
gcp_region    = "us-central1"
gcp_zone      = "us-central1-c"
gcp_auth_file = "./auth/svc_tf.json"

# GCP Netwok
network-subnet-cidr = "10.10.15.0/24"

# Windows VM
windows_instance_type = "e2-medium"
