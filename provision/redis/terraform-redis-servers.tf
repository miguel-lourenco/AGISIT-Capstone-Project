variable "location_id" {
    type = string
}

resource "google_redis_instance" "redis" {
    name = "redis"
    memory_size_gb = 1
    location_id = var.location_id
}
