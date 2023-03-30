variable "params" {
  type        = list(any)
  description = "Parametros para criarfilas sqs e realizar subscriptions em topico sns"
}

variable "sns_topic_name" {
  type        = string
  description = "(optional) Nome do topico sns"
}

variable "fifo_topic" {
  type        = bool
  default     = false
  description = "(optional) Define se topico será FIFO"
}

variable "content_based_deduplication" {
  type        = bool
  default     = false
  description = "(optional) Define se a desduplicação pode ocorrer pelo conteúdo, apenas para topico FIFO"
}

variable "custom_tags" {
  type        = map(any)
  description = "(optional) Tags personalizadas, caso seja necessario"
}

variable "default_tags" {
  type = object({
    owner = string
    contact = string
  })
  description = "(optional) Tags de uso padrao"

  validation {
    condition = can(regex("^[a-zA-Z]+@(gmail|domain)[a-zA-Z.]+[.A-Za-z]+$", var.default_tags.contact))
    error_message = "Preencha a variavel var.default_tags.contact com um e-mail válido."
  }
}

variable "kms_master_key_id" {
  type        = string
  description = "(optional) ID de uma chave KMS personalizada"
  default = ""
}