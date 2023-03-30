variable "deletion_window_in_days" {
  description = "Período de espera, especificado em número de dias. Após o término do período de espera, o AWS KMS exclui a chave KMS. Se você especificar um valor, ele deve estar entre 7 e 30, inclusive. Se você não especificar um valor, o padrão será 30"
  type        = number
  default     = null
}

variable "description" {
  description = "A descrição da chave conforme visualizada no console AWS"
  type        = string
  default     = null
}

variable "enable_key_rotation" {
  description = "Especifica se a rotação de chave está habilitada. O padrão é true"
  type        = bool
  default     = true
}

variable "is_enabled" {
  description = "Especifica se a chave está habilitada. O padrão é true"
  type        = bool
  default     = null
}

variable "policy" {
  description = "Um documento JSON de política válido."
  type        = string
  default     = null
}

variable "aliases" {
  description = "Alias a ser criado para a chave kms"
  type        = string
  default     = null
}

variable "key_usage" {
  description = "Especifica o uso pretendido da chave. Valores válidos: ENCRYPT_DECRYPT ou SIGN_VERIFY. O padrão é ENCRYPT_DECRYPT"
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "multi_region" {
  description = "Indica se a chave KMS é uma chave multirregional (true) ou regional (false). O padrão é falso"
  type        = bool
  default     = false
}

