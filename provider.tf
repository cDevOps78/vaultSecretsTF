provider "vault" {
  address = "https://vault-internal.azcart.online:8200"
  skip_tls_verify = true
}

provider "aws" {
  region = "us-east-1"
}