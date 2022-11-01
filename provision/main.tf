variable "project_id" {
    type = string
}

variable "machine_type" {
    type = string
}

variable "zone" {
    type = string
}

variable "disk_size" {
    type = string
}

#####################################################################
# Modules for Provisioning and Deployment
#####################################################################

# The module in folder 'vuecalc' defines the frontend service
module "vuecalc" {
  source   = "./vuecalc"
  project = var.project_id
  machine = var.machine_type
  zone = var.zone
  disk = var.disk_size
}

# The module in folder 'happy' defines the web server service
module "happy" {
  source   = "./happy"
  project = var.project_id
  machine = var.machine_type
  zone = var.zone
  disk = var.disk_size
}
