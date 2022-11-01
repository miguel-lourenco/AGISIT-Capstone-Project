provider "google" {
    credentials = file("absolute-cipher-367217-88d5e5b84ffc.json")
    project = var.project_id
    zone = var.zone
}
