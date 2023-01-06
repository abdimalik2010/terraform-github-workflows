
### To get started with Terraform and authenticate with Azure:

- [Get started with Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/infrastructure-as-code?in=terraform%2Fazure-get-started)

- Install the Azure CLI: You will need to install the Azure CLI on your local machine in order to authenticate with Azure.[Install-azure-cli from here](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)


- Authenticate with Azure: Run the az login command and follow the prompts to authenticate with Azure.

- Install Terraform: You will need to install Terraform on your local machine in order to manage your Azure infrastructure. [Install Terraform from here](https://developer.hashicorp.com/terraform/downloads)


- Set up a Terraform configuration file: Create a Terraform configuration file and define your Azure infrastructure resources using the HashiCorp Configuration Language (HCL).

- Initialize Terraform: Run the terraform init command to initialize Terraform and download any necessary plugins.

- Create and apply your infrastructure: Use the terraform plan and terraform apply commands to create and apply your Azure infrastructure.

- Manage and update your infrastructure: Use Terraform to manage and update your Azure infrastructure as needed.

- [Terraform useful cli-commands](https://developer.hashicorp.com/terraform/cli/commands)


---

### To store your Terraform state file remotely, create an Azure Storage account

Create resource group

```
az group create --name <RESOURCE_GROUP_NAME> --location westeurope
```
Create storage account

```
az storage account create --resource-group <RESOURCE_GROUP_NAME> --name <STORAGE_ACCOUNT_NAME> --sku Standard_LRS --encryption-services blob
```
Create blob container

```
az storage container create --name <CONTAINER_NAME> --account-name <STORAGE_ACCOUNT_NAME>
```

Configure Terraform to use the remote backend: In your Terraform configuration

---


### To deploy a Terraform workflows on Azure using GitHub CI/CD workflows, you will need to follow these steps:

- [Create an Azure service principal with the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli)

Create an Azure service principal by running the following command:

```
  az ad sp create-for-rbac --name <sp-name> --role contributor \ 
  --scopes /subscriptions/<specify the scope> \
  --sdk-auth
```

-  Save the output of the previous command, as you will need the appId, password, and tenant values later.

-  Create a Terraform configuration file (e.g. main.tf) that describes the infrastructure you want to deploy on Azure.

- Create a GitHub repository and add your Terraform configuration file to it.

- Create a new GitHub workflow by creating a file named .github/workflows/terraform.yml in your repository.

- Add the following YAML code to the terraform.yml file to configure the workflow:

- [Learn Github Actions](https://docs.github.com/en/actions/learn-github-actions)

---

### To add your Service Principal and Storage Access Token as secrets in GitHub Actions:

- Go to the "Settings" tab in your GitHub repository.

- Under the "Secrets" section, click the "Actions" tab.

- Click the "New repository secret" button.

- Enter a name for the secret (e.g. "AZURE_CREDENTIALS") and paste your Azure credentials in the "Value" field.

- Click the "Add secret" button to save the secret.

- You can now use these secrets in your GitHub Actions workflow by referencing the secret name (e.g. ${{ secrets.AZURE_CREDENTIALS }}).
