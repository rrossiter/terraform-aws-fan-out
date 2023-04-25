<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.internal_events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | (optional) Define se a desduplicação pode ocorrer pelo conteúdo, apenas para topico FIFO | `bool` | `false` | no |
| <a name="input_feedback_role_arn"></a> [feedback\_role\_arn](#input\_feedback\_role\_arn) | (optional) Role Arn contendo as permissões para receber feedback de sucesso/erro no processamento do topico | `string` | n/a | yes |
| <a name="input_fifo_topic"></a> [fifo\_topic](#input\_fifo\_topic) | (optional) Define se topico será FIFO | `bool` | `false` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | (optional) ID de uma chave KMS personalizada | `string` | n/a | yes |
| <a name="input_params"></a> [params](#input\_params) | (optional) Parametros para criar subscriptions | `list(any)` | n/a | yes |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | (optional) Nome do topico sns | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subs"></a> [subs](#output\_subs) | n/a |
<!-- END_TF_DOCS -->