module "kms" {
  source = "../"

  deletion_window_in_days = 7
  description             = "Key"
  enable_key_rotation     = true
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"
  multi_region            = false

  aliases = "fanout"
}