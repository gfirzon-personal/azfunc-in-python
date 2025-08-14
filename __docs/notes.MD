az group create --name "AzureFunctionsQuickstart-rg" --location "<REGION>"
```sh
az group create --name "AzureFunctionsQuickstart-rg" --location "eastus2"
```
eastus2

```sh
az storage account create --name gpstorageaccountazf --location "eastus2" --resource-group "AzureFunctionsQuickstart-rg" --sku "Standard_LRS" --allow-blob-public-access false --allow-shared-key-access false
```

```sh
export PATH=$PATH:/c/apps
```

```sh
az functionapp create --resource-group "AzureFunctionsQuickstart-rg" --name gfirzonsampleazapp --flexconsumption-location eastus2 --runtime python --runtime-version 3.11 --storage-account gpstorageaccountazf --deployment-storage-auth-type UserAssignedIdentity --deployment-storage-auth-value "func-host-storage-user"
```

```sh
func azure functionapp publish gfirzonsampleazapp
```