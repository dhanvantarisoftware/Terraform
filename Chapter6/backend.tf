terraform {
  backend "s3" {
    bucket = "harshabigbucket"
    key    = "terrastatus/terraformstate"
    region = "us-east-2"
  }
}