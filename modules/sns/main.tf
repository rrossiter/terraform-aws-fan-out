data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_sns_topic" "internal_events" {
  name                        = var.fifo_topic == false ? var.sns_topic_name : "${var.sns_topic_name}.fifo"
  fifo_topic                  = var.fifo_topic
  kms_master_key_id = var.kms_master_key_id 
  content_based_deduplication = var.content_based_deduplication

  # sqs_success_feedback_role_arn    = "arn:aws:iam::812638386730:role/SNSSuccessFeedback"
  # sqs_failure_feedback_role_arn    = "arn:aws:iam::812638386730:role/SNSFailureFeedback"
  sqs_success_feedback_role_arn = var.feedback_role_arn
  sqs_failure_feedback_role_arn = var.feedback_role_arn

  sqs_success_feedback_sample_rate = 100



  delivery_policy = <<JSON
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
JSON
}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
  sqsArn     = "arn:aws:sqs:${local.region}:${local.account_id}"
  params = {
    for param in var.params : param.name => {
      protocol      = param.service
      sqsArn        = param.service == "sqs" && var.fifo_topic == false ? "${local.sqsArn}:${param.name}" : param.service == "sqs" && var.fifo_topic == true ? "${local.sqsArn}:${param.name}.fifo" : ""
      lambdaArn     = param.service == "lambda" ? "arn:aws:lambda:${local.region}:${local.account_id}:function:${param.name}" : ""
      filter_name   = param.filter_name
      filter_policy = param.filter_policy
    }
  }
}

resource "aws_sns_topic_subscription" "subscription" {
  for_each = local.params

  topic_arn              = aws_sns_topic.internal_events.arn
  raw_message_delivery   = true
  protocol               = each.value.protocol
  endpoint               = coalesce(each.value.sqsArn, each.value.lambdaArn)
  endpoint_auto_confirms = true

  filter_policy = templatefile("${path.module}/filter_policy.json", {
    filter_name   = each.value.filter_name != "" ? each.value.filter_name : null
    filter_policy = each.value.filter_policy != "" ? each.value.filter_policy : null
  })

}

output "subs" {
  value = aws_sns_topic_subscription.subscription[*]
}