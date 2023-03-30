<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.60.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_create_queue_list"></a> [aws\_create\_queue\_list](#module\_aws\_create\_queue\_list) | ../sqs | n/a |
| <a name="module_aws_iam_sns_logging"></a> [aws\_iam\_sns\_logging](#module\_aws\_iam\_sns\_logging) | ../iam | n/a |
| <a name="module_kms"></a> [kms](#module\_kms) | ../kms | n/a |
| <a name="module_sns"></a> [sns](#module\_sns) | ../sns | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | (optional) Define se a desduplicação pode ocorrer pelo conteúdo, apenas para topico FIFO | `bool` | `false` | no |
| <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags) | (optional) Tags personalizadas, caso seja necessario | `map(any)` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | (optional) Tags de uso padrao | <pre>object({<br>    owner = string<br>  })</pre> | n/a | yes |
| <a name="input_fifo_topic"></a> [fifo\_topic](#input\_fifo\_topic) | (optional) Define se topico será FIFO | `bool` | `false` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | (optional) ID de uma chave KMS personalizada | `string` | `""` | no |
| <a name="input_params"></a> [params](#input\_params) | Parametros para criarfilas sqs e realizar subscriptions em topico sns | `list(any)` | n/a | yes |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | (optional) Nome do topico sns | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->