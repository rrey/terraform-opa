resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "eu-west1-a"

  tags = ["foo", "bar"]

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = "${google_compute_network.default.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80" ]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "default" {
  name = "default"
}
