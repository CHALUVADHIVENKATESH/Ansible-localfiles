resource "aws_instance" "master" {

  ami = "ami-0fb653ca2d3203ac1"

  availability_zone           = "us-east-2a"
  instance_type               = "t2.micro"
  key_name                    = "Ohio-Keypair3"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Docker-Master-01"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
    #!/bin/bash

    echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTGqh87brDDs2sjyhx94ggfJmS+MmD7yKZ2NdDcMoIb4xndXRsqL1TIJyGOA4cW3MLULDFummwGfdTj0PeGIara/0aMVcimJHzTRwgGvijmO6QwfefHnVtX45IKmEZJOLhYDXcBBxI2EFUoHiQuy51xMjemrQ/AENWoF+PYq/qmvedUibXZ63r+IhiUcAKQo8zOZEzYuK0eLB5Dq8VKijnhZfRh856fEQmNrsFbPWxhYFtPy4/2Fi4OEIs0h/pbQMLJHygwmil4W2cer9gZhdcOWuAIZQnm/8w2+5gYvc/LeXT5cKMThzjUCrYfyzMVVvR7pmMySjDeZH8q12xgpPffQw4Oq19J4LYXidyaB50cYJqIMb6pxj1FJuVZ02FWKfW6cnxpJ+feLFrf4lX+Iwr1xZNkYmaOHeOq3Spw/j26aaRPhG7IL9miTvq7zUlo8Q3Z7H+x+vRCICSUcT2nkszjmyqAcrbgAMHMHig57w0TOk6NN2zgY06NP+MM3pVsOU= root@ip-172-31-10-167' > /home/ubuntu/.ssh/authorized_keys
    EOF

}

resource "aws_instance" "WorkerNode" {
  count=3
  ami = "ami-0fb653ca2d3203ac1"

  availability_zone           = "us-east-2a"
  instance_type               = "t2.micro"
  key_name                    = "Ohio-Keypair3"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Docker-WorkerNode-0${count.index+1}"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
    #!/bin/bash
    echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTGqh87brDDs2sjyhx94ggfJmS+MmD7yKZ2NdDcMoIb4xndXRsqL1TIJyGOA4cW3MLULDFummwGfdTj0PeGIara/0aMVcimJHzTRwgGvijmO6QwfefHnVtX45IKmEZJOLhYDXcBBxI2EFUoHiQuy51xMjemrQ/AENWoF+PYq/qmvedUibXZ63r+IhiUcAKQo8zOZEzYuK0eLB5Dq8VKijnhZfRh856fEQmNrsFbPWxhYFtPy4/2Fi4OEIs0h/pbQMLJHygwmil4W2cer9gZhdcOWuAIZQnm/8w2+5gYvc/LeXT5cKMThzjUCrYfyzMVVvR7pmMySjDeZH8q12xgpPffQw4Oq19J4LYXidyaB50cYJqIMb6pxj1FJuVZ02FWKfW6cnxpJ+feLFrf4lX+Iwr1xZNkYmaOHeOq3Spw/j26aaRPhG7IL9miTvq7zUlo8Q3Z7H+x+vRCICSUcT2nkszjmyqAcrbgAMHMHig57w0TOk6NN2zgY06NP+MM3pVsOU= root@ip-172-31-10-167' > /home/ubuntu/.ssh/authorized_keys
    EOF

}

resource "aws_instance" "ExtraMasters" {
  count=2
  ami = "ami-0fb653ca2d3203ac1"

  availability_zone           = "us-east-2a"
  instance_type               = "t2.micro"
  key_name                    = "Ohio-Keypair3"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Docker-Master-0${count.index+2}"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
    #!/bin/bash

    echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTGqh87brDDs2sjyhx94ggfJmS+MmD7yKZ2NdDcMoIb4xndXRsqL1TIJyGOA4cW3MLULDFummwGfdTj0PeGIara/0aMVcimJHzTRwgGvijmO6QwfefHnVtX45IKmEZJOLhYDXcBBxI2EFUoHiQuy51xMjemrQ/AENWoF+PYq/qmvedUibXZ63r+IhiUcAKQo8zOZEzYuK0eLB5Dq8VKijnhZfRh856fEQmNrsFbPWxhYFtPy4/2Fi4OEIs0h/pbQMLJHygwmil4W2cer9gZhdcOWuAIZQnm/8w2+5gYvc/LeXT5cKMThzjUCrYfyzMVVvR7pmMySjDeZH8q12xgpPffQw4Oq19J4LYXidyaB50cYJqIMb6pxj1FJuVZ02FWKfW6cnxpJ+feLFrf4lX+Iwr1xZNkYmaOHeOq3Spw/j26aaRPhG7IL9miTvq7zUlo8Q3Z7H+x+vRCICSUcT2nkszjmyqAcrbgAMHMHig57w0TOk6NN2zgY06NP+MM3pVsOU= root@ip-172-31-10-167' > /home/ubuntu/.ssh/authorized_keys
    EOF

}
