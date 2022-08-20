variable "region" {
  default = "europe-west2"
}

variable "zone" {
  default = "europe-west2-c"
}

variable "gcp_project" {
  default = "619997979506"
}


/*
connection {
      agent       = false
      host        = "${access_config.0.nat_ip}"
      type        = "ssh"
      user        = "cjetty"
      timeout     = "500s"
      private_key = "${file("C:\\Users\\JET73937\\.ssh\\gcp_private_key.ppk")}"
    }
*/