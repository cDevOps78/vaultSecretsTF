
resource "vault_mount" "kv" {
  path        = var.path_m
  type        = "kv"
  options     = { version = "1" }
  description = var.description_m
}


resource "vault_kv_secret" "secret" {
  path = "${vault_mount.kv.path}/${var.secret_m}"
  data_json = jsonencode("${var.secret_data}")
}



#resource "vault_mount" "kvv1" {
#  path        = "kvv1"
#  type        = "kv"
#  options     = { version = "1" }
#  description = "KV Version 1 secret engine mount"
#}
#
#resource "vault_kv_secret" "secret" {
#  path = "${vault_mount.kvv1.path}/secret"
#  data_json = jsonencode(
#    {
#      zip = "zap",
#      foo = "bar"
#    }
#  )
#}