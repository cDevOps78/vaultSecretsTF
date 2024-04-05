module "common" {
  source        = "./module"
  path_m        =  "common"
  description_m = "This is ssh vault secrets"
  secret_m      = "ssh"
  secret_data   = {
       ansible_user     = "ec2-user"
       ansible_password = "DevOps321"
  }
}

module "expense-dev" {
  source        = "./module"
  path_m        =  "expense-dev"
  description_m = "This is newrelic vault secrets"
  secret_m      = "newrelic"
  secret_data   = {
    NEW_RELIC_NGINX   = var.NEW_RELIC_NGINX
    NEW_RELIC_BACKEND = var.NEW_RELIC_BACKEND
  }
}



