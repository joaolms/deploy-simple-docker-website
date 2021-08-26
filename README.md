# Azure WebApp Deploy
## Descrição
Realizar o build e o deploy de um container com um site estático em docker no Azure WebApp.

## Variáveis
|VARIÁVEL|DESCRIÇÃO|VALOR PADRÃO|
---------|---------|------------|
DOCKER_HUB_ACCESS_TOKEN | Personal Access Token do Docker Hub | Não
DOCKER_HUB_USERNAME | Usuário para utenticar no Docker Hub | Não
AZURE_CREDENTIALS | Service Principal do Azure em formato JSON | Não

## Credencias Azure
Gerar o Service Principal a armazenar no Secrets **AZURE_CREDENTIALS** no seguinte formato:
```json
{
  "clientId": "<GUID>",
  "clientSecret": "<GUID>",
  "subscriptionId": "<GUID>",
  "tenantId": "<GUID>"
}
```

