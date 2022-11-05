
# Elemets of the cloud such as virtual servers,
# networks, firewall rules are created as resources
# syntax is: resource RESOURCE_TYPE RESOURCE_NAME
# https://www.terraform.io/docs/configuration/resources.html

resource "google_compute_firewall" "frontend_rules" {
  name    = "lb-happy"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["4000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["lb-happy"]
}
