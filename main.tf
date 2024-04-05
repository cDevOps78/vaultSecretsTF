module "common" {
  source        = "./module"
  path_m        =  "common1"
  description_m = "This is common vault secrets"
  secret_m      = "ssh1"
  secret_data   = {
    name    = "chaithanya"
    job     = "devops_chaithnaya"
    trainer = "raghu_sir"
  }
}