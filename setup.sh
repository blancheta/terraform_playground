# Read a secret from Azure Key Vault

#secret="$(az keyvault secret show --vault-name upidev --name docker-container-pass --query value)"
#echo $secret
#echo "$secret" | jq -r
#
## Use a key to encrypt a file and decrypt the string
#
## Read file content
#file_content=$(cat coca-cola-ingredients.txt)
#echo $file_content
#
## Encrypt file content
#encrypted_content=$(echo -n "$file_content" | base64 | az keyvault key encrypt --vault-name upidev --name top-secret-key --algorithm RSA-OAEP --value @- --query "result")
#echo $encrypted_content
#echo "$encrypted_content" > encrypted-coca-cola-ingredients.txt
#
## Decrypt file content
#encrypted_content=$(cat ./encrypted-coca-cola-ingredients.txt)
#decrypted_content=$(az keyvault key decrypt --vault-name upidev --name top-secret-key --algorithm RSA-OAEP --value "$encrypted_content" --query "result" -o tsv | base64 -d)
#
#echo $decrypted_content

# Get subscription id
subscription_id=$(az account show --query id)
subscription_id=$(echo $subscription_id | jq -r)

terraform plan -var subscription_id=$subscription_id
