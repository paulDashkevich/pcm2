resource "local_file" "AnsibleInventory" {
  content = templatefile("./ansible/inventory.tpl",
    {
      ip     = ah_cloud_server.pcm.*.ips.0.ip_address,
      int_ip = ah_private_network_connection.path1.*.ip_address
    }
  )
  filename = "hosts"

  #  provisioner "local-exec" {
  #    command = "ansible-playbook ansible/site.yml"
  #  }

}
