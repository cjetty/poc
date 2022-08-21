provider "google" {
  project = var.gcp_project
  region  = var.region
  zone    = var.zone
  #credentials = file("C:\\Users\\JET73937\\.ssh\\du-poc-aa47ede6945f.json")
}

module "Du_cluster" {
  source  = "./Du_cluster"
}

