variable "params" {
  type        = list(any)
  description = "(optional) Parametros para criar subscriptions"
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

variable "feedback_role_arn" {
  type        = string
  description = "(optional) Role Arn contendo as permissões para receber feedback de sucesso/erro no processamento do topico"
}

variable "kms_master_key_id" {
  type        = string
  description = "(optional) ID de uma chave KMS personalizada"
}