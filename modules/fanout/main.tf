module "aws_iam_sns_logging" {
  source = "../iam"
}

module "kms" {
  source = "../kms"

  deletion_window_in_days = 7
  description             = "Key"
  enable_key_rotation     = true
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"
  multi_region            = false

  aliases = "fanout"
}

module "aws_create_queue_list" {
  source = "../sqs"
  kms_master_key_id = module.kms.key_id
  queues = var.params
}

module "sns" {
  source                      = "../sns"
  sns_topic_name              = var.sns_topic_name
  kms_master_key_id = module.kms.key_id
  fifo_topic                  = var.fifo_topic
  content_based_deduplication = var.content_based_deduplication
  params                      = var.params
  feedback_role_arn           = module.aws_iam_sns_logging.arn
}