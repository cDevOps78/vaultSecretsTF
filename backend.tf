terraform {
  backend "s3" {
    bucket = "b78-chaitu1"
    key    = "vault/state"
    region = "us-east-1"
  }
}