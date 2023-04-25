
output "arn" {
  value = aws_iam_role.iam_role_logs.arn
}

data "aws_iam_policy_document" "iam_policy_document" {
  statement {
    sid = "allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutMetricFilter",
      "logs:PutRetentionPolicy"
    ]
    resources = [
      "*"
    ]
  }

}

resource "aws_iam_policy" "iam_policy" {
  name        = "sns_delivery_status"
  description = "Create log, put events and metrics"
  path        = "/"

  policy = data.aws_iam_policy_document.iam_policy_document.json
}

resource "aws_iam_role" "iam_role_logs" {
  name        = "iam_role_logs"
  description = "Create log, put events and metrics"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "sns.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  role       = aws_iam_role.iam_role_logs.name
  policy_arn = aws_iam_policy.iam_policy.arn
}
