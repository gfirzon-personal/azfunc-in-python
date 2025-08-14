# assign-identity.sh
# to run -> bash assign-identity.sh

# Ensure you are logged in
if ! az account show > /dev/null 2>&1; then
  echo "You are not logged in to Azure CLI. Please log in."
  az login
  if [ $? -ne 0 ]; then
    echo "Azure login failed. Exiting."
    exit 1
  fi
fi

# Set Azure cloud to AzureCloud
az cloud set --name AzureCloud

# Check if a subscription is set
current_sub=$(az account show --query id -o tsv 2>/dev/null)

if [ -z "$current_sub" ]; then
  echo "No Azure subscription is set."
  echo "Available subscriptions:"
  az account list --output table
  echo ""
  read -p "Enter the subscription ID or name to use: " sub_id
  az account set --subscription "$sub_id"
  if [ $? -ne 0 ]; then
    echo "Failed to set subscription. Exiting."
    exit 1
  fi
  # Re-check if the subscription is now set
  current_sub=$(az account show --query id -o tsv 2>/dev/null)
  if [ -z "$current_sub" ]; then
    echo "Subscription is still not set. Please check your Azure login and subscription access."
    exit 1
  fi
  echo "Successfully set Azure subscription: $current_sub"
else
  echo "Using Azure subscription: $current_sub"
fi

# Verify access to resource group
if ! az group list --query "[?name=='AzureFunctionsQuickstart-rg']" | grep -q "AzureFunctionsQuickstart-rg"; then
  echo "Resource group 'AzureFunctionsQuickstart-rg' not found or you do not have access."
  exit 1
fi

output=$(az identity create --name "func-host-storage-user" --resource-group "AzureFunctionsQuickstart-rg" --location eastus2 --query "{userId:id, principalId: principalId, clientId: clientId}" -o json)

userId=$(echo $output | jq -r '.userId')
principalId=$(echo $output | jq -r '.principalId')
clientId=$(echo $output | jq -r '.clientId')

storageId=$(az storage account show --resource-group "AzureFunctionsQuickstart-rg" --name gpstorageaccountazf --query 'id' -o tsv)
az role assignment create --assignee-object-id $principalId --assignee-principal-type ServicePrincipal --role "Storage Blob Data Owner" --scope $storageId