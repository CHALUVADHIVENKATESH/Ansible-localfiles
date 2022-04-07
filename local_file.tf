resource "local_file" "hosts_cfg" {
  content = templatefile("hosts.tpl",
    {
      server1 = aws_instance.master.public_ip
      server2 = aws_instance.ExtraMasters.0.public_ip
      server3 = aws_instance.ExtraMasters.1.public_ip
      server4 = aws_instance.WorkerNode.0.public_ip
      server5 = aws_instance.WorkerNode.1.public_ip
      server6 = aws_instance.WorkerNode.2.public_ip

    }
  )
  filename = "/root/terraformsingleinstance/hosts.cfg"
}
