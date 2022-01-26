# azure-terraform-demo
Quick demo into Terraform running on Azure 

**Prerequisites**

* Azure Subscription
* Terraform 0.14.9 or later
* The Azure CLI Tool installed

**Install the Azure CLI tool**

**Windows**

Powershell 

```$ Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi```

**Mac**

```$ brew update && brew install azure-cli```

**linux**

taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=dnf

**RHEL/YUM** 

Import the Microsoft repository key.

```sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc```

Create local azure-cli repository information.

```echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo```

Install with the dnf install command.

```sudo dnf install azure-cli```


**Install Terraform linux** 

Install yum-config-manager to manage your repositories.

```$ sudo yum install -y yum-utils```

Use yum-config-manager to add the official HashiCorp Linux repository.

```$ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo```

Install.

```$ sudo yum -y install terraform```


**Authenticate using the Azure CLI**

Terraform must authenticate to Azure to create infrastructure

```az login  ```
