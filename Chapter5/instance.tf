resource "aws_key_pair" "terra-key" {
  key_name   = "terrakey"
  public_key = file("terrakey.pub")
}

resource "aws_instance" "provision-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = ["sg-0769543aea06483ab"]
  tags = {
    Name    = "Provision-Instance"
    Project = "Terraform"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("terrakey")
    host        = self.public_ip
  }

}

output "PublicIP" {
  value = aws_instance.provision-inst.public_ip
}

output "PrivateIP" {
  value = aws_instance.provision-inst.private_ip
}