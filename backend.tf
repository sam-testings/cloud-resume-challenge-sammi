terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "sammi-tf-state"
    dynamodb_table = "sammi-tf-state-lock"
    key            = "sammi-static-website.tfstate"
    region         = "us-east-1"
  }
}