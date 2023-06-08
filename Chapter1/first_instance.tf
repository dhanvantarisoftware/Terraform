provider "aws" {
  region = "us-east-2"
  #   access_key = ""
  #   secret_key = ""	
}

resource "aws_instance" "provision-inst" {
  ami                    = "ami-05842f1afbf311a43"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-2a"
  key_name               = "Terraform"
  vpc_security_group_ids = ["sg-0769543aea06483ab"]
  tags = {
    Name    = "Provision-Instance"
    Project = "Terraform"
  }
}