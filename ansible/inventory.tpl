[target]
iscsi   ansible_host=${ip[0]} ansible_subnet_host=${int_ip[0]} ansible_connection=ssh ansible_user=adminroot

[servers]
server0 ansible_host=${ip[1]} ansible_subnet_host=${int_ip[1]} ansible_connection=ssh ansible_user=adminroot
server1 ansible_host=${ip[2]} ansible_subnet_host=${int_ip[2]} ansible_connection=ssh ansible_user=adminroot
server2 ansible_host=${ip[3]} ansible_subnet_host=${int_ip[3]} ansible_connection=ssh ansible_user=adminroot

