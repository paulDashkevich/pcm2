resource "ah_cloud_server" "pcm" {
  backups    = false
  count      = 4
  name       = "node_${count.index}"
  datacenter = var.ah_dc
  image      = var.ah_image_type
  product    = var.ah_machine_type
  ssh_keys   = [var.ah_fp]
}

resource "ah_private_network" "path1" {
  ip_range = "10.1.0.0/24"
  name     = "LAN for cluster1"
}

resource "ah_private_network" "path2" {
  ip_range = "10.1.1.0/24"
  name     = "LAN for cluster2"
}

resource "ah_volume" "harddrive" {
  #count   = 2 #esli nado hdd bolee 1
  name        = "hdd"
  product     = var.ah_hdd
  file_system = "ext4"
  size        = "1"
}

resource "ah_volume_attachment" "add-hdd" {
  cloud_server_id = ah_cloud_server.pcm[0].id
  volume_id       = ah_volume.harddrive.id
  #for_each = toset(var.hdds) #podkluchenie bolee 1go hdd
  #volume_id = ah_volume.harddrive[each.value].id
  #depends_on = [
  #  ah_cloud_server.pcm,
  #  ah_private_network.path1
  #]
}

resource "ah_private_network_connection" "path1" {
  count              = 4
  cloud_server_id    = ah_cloud_server.pcm[count.index].id
  private_network_id = ah_private_network.path1.id
  ip_address         = "10.1.0.${count.index + 10}"
}

resource "ah_private_network_connection" "path2" {
  count              = 4
  cloud_server_id    = ah_cloud_server.pcm[count.index].id
  private_network_id = ah_private_network.path2.id
  ip_address         = "10.1.1.${count.index + 10}"
}
