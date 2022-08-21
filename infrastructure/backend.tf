
terraform {
 backend "gcs" {
   #credentials = file("C:\\Users\\JET73937\\.ssh\\du-poc-aa47ede6945f.json")
   bucket  = "du-poc-github-backend-state"
   prefix  = "terraform/state"
 }
}
