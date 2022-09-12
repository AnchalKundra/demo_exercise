provider "google" {
  project     = "burner-anckundr"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_service_account" "exercise" {
  account_id   = "burner-anckundr"
  display_name = "Sample Account"
}

resource "google_compute_instance" "Prac" {
  name         = "test"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  #tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  /*// Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }
  */


  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  /*metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"
*/
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    #email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
