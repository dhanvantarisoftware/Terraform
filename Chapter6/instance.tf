resource "aws_key_pair" "terraform-key" {
  key_name   = "terrakey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "provision-web" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.myvpc-pub-1.id
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = [aws_security_group.my_stack_sg.id]
  tags = {
    Name = "Provision-Instance"
  }
}

resource "aws_ebs_volume" "vol_4_myvol" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extr-vol-4-myvol"
  }
}

resource "aws_volume_attachment" "atch_vol_myvol" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_myvol.id
  instance_id = aws_instance.provision-web.id
}

output "PublicIP" {
  value = aws_instance.provision-web.public_ip
}