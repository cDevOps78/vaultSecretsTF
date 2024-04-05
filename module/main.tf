
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