resource "aws_kms_key" "kms_key" {

  deletion_window_in_days = var.deletion_window_in_days
  description             = var.description
  enable_key_rotation     = var.enable_key_rotation
  is_enabled              = var.is_enabled
  key_usage               = var.key_usage
  multi_region            = var.multi_region
  # policy                             = coalesce(var.policy, data.aws_iam_policy_document.this[0].json)
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "sns.amazonaws.com"
      },
      "Action" : [
        "kms:GenerateDataKey",
        "kms:Decrypt"
      ],
      "Resource" : "*"
    },
    {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::812638386730:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        }]
  })

}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.aliases}"
  target_key_id = aws_kms_key.kms_key.key_id
}
