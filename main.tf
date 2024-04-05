module "common" {
  source        = "./module"
  path_m        =  "common1"
  description_m = "This is common vault secrets"
  secret_m      = "ssh1"
  secret_data   = {
       ansible_user     = "ec2-user"
       ansible_password = "DevOps321"
  }
}

module "expense-dev" {
  source        = "./module"
  path_m        =  "expense"
  description_m = "This is common vault secrets"
  secret_m      = "nginx"
  secret_data   = {
    NEW_RELIC_NGINX = var.NEW_RELIC_NGINX
  }
}

