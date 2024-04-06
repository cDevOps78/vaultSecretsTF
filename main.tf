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

#module "expense-dev-mysql" {
#  source        = "./module"
#  path_m        =  "expense-dev"
#  description_m = "This is mysql vault secrets"
#  secret_m      = "mysql"
#  secret_data   = {
#    mysql_root_password = "ExpenseApp@1"
#  }
#}

resource "vault_kv_secret" "mysql" {
  path = "expense-dev/mysql"
  data_json = jsonencode(
    {
      mysql_root_password = "ExpenseApp@1"
    }
  )
}

resource "vault_kv_secret" "backend" {
  path = "expense-dev/backend"
  data_json = jsonencode(
    {
      mysql_login_user = "root"
      mysql_login_password = "ExpenseApp@1"
      NEW_RELIC_BACKEND = var.NEW_RELIC_BACKEND
    }
  )
}

resource "vault_kv_secret" "frontend" {
  path = "expense-dev/backend"
  data_json = jsonencode(
    {
      NEW_RELIC_NGINX = var.NEW_RELIC_NGINX
    }
  )
}



