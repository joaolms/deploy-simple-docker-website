# Azure WebApp Deploy
## Descrição
Realizar o build e o deploy de um container com um site estático em docker no Azure WebApp.

## Variáveis secretas no github actions
VARIÁVEL|DESCRIÇÃO
---------|---------
DOCKER_HUB_ACCESS_TOKEN | Personal Access Token do Docker Hub
DOCKER_HUB_USERNAME | Usuário para utenticar no Docker Hub
AZURE_CREDENTIALS | Service Principal do Azure em formato JSON

## Credencias Azure
Gerar o Service Principal a armazenar no Secrets **AZURE_CREDENTIALS**:

```bash
az ad sp create-for-rbac --name "<SERVICE_PRINCIPAL_NAME>" --sdk-auth --role contributor --scopes /subscriptions/<SUBCRIPTION_ID>
```

```json
{
  "clientId": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "clientSecret": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "subscriptionId": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "tenantId": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
```

## Terraform
Os arquivos do terraform estão no diretório **tf-infra** e está sendo utilizado o Terraform Cloud para gerenciamento do *state* do Terraform.
Crie um orgnização no Terraform Cloud, assim como um workspace conectado ao repositório do Github.
Nas configurações do workspace, configure o diretório **tf-infra** como trigger e mantenha o monitoramento da branch default, desta forma o terraform só será acionado com alterações no diretório tf-infra e na branch main.

### Variáveis necessárias para o Terraform
As variáveis do terraform estão no arquivo **tf-infra/variables.tf**

VARIÁVEL|DESCRIÇÃO|VALOR PADRÃO
--------|---------|------------
location|Região do Azure|eastus
webapp_resource_group|Grupo de Recursos que será criado pelo Terraform para o Webapp|WEBAPP-ATL
webapp_name|Nome do Azure WebApp|webapp-atl-09876
webapp_health_check_path|Path para monitoramento via health check| /
terraform_organization|Orzanização que será usada no Terraform Cloud|orgjoaolms
terraform_workspace|Workspace dentro da organização do Terraform Cloud|deploy-simple-docker-website

### Variáveis no Terraform Cloud
É preciso configurara as variáveis do Service Principal para que o Terraform Cloud tenha acesso ao Azure.
Essas variáveis devem ser configuradas na workspace do Terraform Cloud.

VARIÁVEL|DESCRIÇÃO|VALOR PADRÃO
--------|---------|------------
ARM_TENANT_ID | Tenant do Azure | Não
ARM_SUBSCRIPTION_ID | Sua Subcription ID | Não
ARM_CLIENT_ID | Client ID do Service Principal | Não
ARM_CLIENT_SECRET | Senha do Client ID | Não

### Criar infraestrutura
Ao finalizar as configurações da workspace no Terraform Cloud, clique no botão **Queue** e confirme as alterações.

## Deploy da uma nova versão.
O workflow do github action está configurado no aruivo ```.github/workflows/deploy-webap.yml``` e só é executado com alterações na branch **main**
Altere o arquivo ```src/index.html``` e confirme na branch **main**.