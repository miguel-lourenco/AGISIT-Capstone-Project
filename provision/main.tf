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
  machine_type = var.machine_type
  zone = var.zone
}

# The module in folder 'happy' defines Hapi service
module "happy" {
  source   = "./happy"
  machine_type = var.machine_type
  zone = var.zone
}

# The module in folder 'expressed' defines Express service
module "expressed" {
  source   = "./expressed"
  machine_type = var.machine_type
  zone = var.zone
}

# The module in folder 'bootstorage' defines Spring boot service
module "bootstorage" {
  source   = "./bootstorage"
  machine_type = var.machine_type
  zone = var.zone
}

# The module in folder 'redis' defines the redis service
module "redis" {
  source   = "./redis"
  location_id = var.zone
}

# The module in folder 'lb-happy' defines loadbalancer for happy requests
module "lb-happy" {
  source   = "./lb-happy"
  machine_type = var.machine_type
  zone = var.zone
}

# The module in folder 'lb-expressed' defines the loadbalancer for expressed requests
module "lb-expressed" {
  source   = "./lb-expressed"
  machine_type = var.machine_type
  zone = var.zone
}
