variable "REGION" {
  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-05842f1afbf311a43"
    us-east-1 = "ami-0bef6cc322bfff646"
  }
}