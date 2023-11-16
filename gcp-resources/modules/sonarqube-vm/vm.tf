resource "google_compute_instance" "sonarqube" {
  name         = var.sonar_instance_name
  project      = var.project_id
  machine_type = var.vm_machine_type
  zone         = var.zone

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        name = "sonarqube-vm-disk"
      }
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet
    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    ssh-keys = "${var.user_name}:${file(var.public_key)}"
  }

  metadata_startup_script = file("${path.module}/startup_script.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.service_account
    scopes = ["cloud-platform"]
  }
}

resource "null_resource" "install_sonarqube" {
  provisioner "local-exec" {
    connection {
      type        = "ssh"
      user        = var.user_name
      host        = google_compute_instance.sonarqube.network_interface[0].access_config[0].nat_ip
      private_key = file(var.private_key)
    }

    command = <<EOT
      sleep 25;
        >sonarqube_inventory;
        echo ["sonarqube"] | tee -a sonarqube_inventory;
        echo "${google_compute_instance.sonarqube.network_interface[0].access_config[0].nat_ip} ansible_user=${var.user_name} ansible_ssh_common_args='-o StrictHostKeyChecking=no'" | tee -a sonarqube_inventory;
        ansible-playbook --private-key ${var.private_key} -i sonarqube_inventory playbooks/sonarqube.yaml -e "hub_username=XXXXXXX hub_password=XXXXXXX"
    EOT
  }

  depends_on = [google_compute_instance.sonarqube]
}
