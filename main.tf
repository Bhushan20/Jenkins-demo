resource "google_compute_instance" "terra-vm" {
  name         = "my-terra-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

   boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"
  }

  metadata_startup_script = "echo hi > /test.txt"

}

output "google_compute_instance" {
  value = google_compute_instance.terra-vm.name
}
