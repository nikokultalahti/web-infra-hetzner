data template_file "user_data" {
  template = file("${path.module}/templates/user_data.yaml")

  vars = {
    username       = "${var.username}"
    ssh_public_key = "${var.ssh_public_key}"
  }
}