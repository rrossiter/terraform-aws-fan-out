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
| [aws_kms_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aliases"></a> [aliases](#input\_aliases) | Alias a ser criado para a chave kms | `string` | `null` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | Período de espera, especificado em número de dias. Após o término do período de espera, o AWS KMS exclui a chave KMS. Se você especificar um valor, ele deve estar entre 7 e 30, inclusive. Se você não especificar um valor, o padrão será 30 | `number` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | A descrição da chave conforme visualizada no console AWS | `string` | `null` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Especifica se a rotação de chave está habilitada. O padrão é true | `bool` | `true` | no |
| <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled) | Especifica se a chave está habilitada. O padrão é true | `bool` | `null` | no |
| <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage) | Especifica o uso pretendido da chave. Valores válidos: ENCRYPT\_DECRYPT ou SIGN\_VERIFY. O padrão é ENCRYPT\_DECRYPT | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | Indica se a chave KMS é uma chave multirregional (true) ou regional (false). O padrão é falso | `bool` | `false` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | Um documento JSON de política válido. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | n/a |
<!-- END_TF_DOCS -->