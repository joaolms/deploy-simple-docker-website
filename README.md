# Azure WebApp Deploy
## Descrição
Realizar o build e o deploy de um container com um site estático em docker no Azure WebApp.

## Variáveis secretas
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
