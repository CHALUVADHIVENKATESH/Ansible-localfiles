[allservers]
server1 ansible_host=${server1} ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server2 ansible_host=${server2} ansible_connection=ssh ansible_user=ubuntu ansible_port=22
server3 ansible_host=${server3} ansible_connection=ssh ansible_user=ubuntu ansible_port=22


[web]
server1 ansible_host=${server1} ansible_connection=ssh ansible_user=ubuntu ansible_port=22


[app]
server2 ansible_host=${server2} ansible_connection=ssh ansible_user=ubuntu ansible_port=22


[db]
server3 ansible_host=${server3} ansible_connection=ssh ansible_user=ubuntu ansible_port=22




