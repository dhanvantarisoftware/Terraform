resource "aws_instance" "Provision-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "Terraform"
  vpc_security_group_ids = ["sg-0769543aea06483ab"]
  tags = {
    Name    = "Provision-Instance"
    Project = "Terraform"
  }
}