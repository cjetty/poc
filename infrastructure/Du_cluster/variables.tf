variable "du_instance_type" {
  default = "e2-medium"
}

variable "du_instance_image" {
    default = "debian-11-bullseye-v20220719"
    #default = "projects/du-poc/zones/europe-west2-c/disks/du-instance-2"
}


variable "node_pools_oauth_scopes" {
  type        = map(list(string))
  description = "Map of lists containing node oauth scopes by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = ["https://www.googleapis.com/auth/cloud-platform"]
    default-node-pool = []
  }
}

/*
variable "user_data" {
  default = "C:\\DU_GCP\\Du_cluster\\user_data.txt"  
}
*/

variable "zone" {
  default = "europe-west2-b"
}