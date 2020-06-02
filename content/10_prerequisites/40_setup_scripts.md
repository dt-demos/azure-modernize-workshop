+++
title = "Setup Scripts"
chapter = false
weight = 40
+++

![image](/images/jess.png)

In the next sections, your will complete the following:

* Open Azure Cloud Shell for running various UNIX commands
* Capture environment and token info needed for automation scripts
* Provision easyTravel application
* Verify EasyTravel application is running

### 1. Open Azure Cloud Shell

1 . Navigate to https://portal.azure.com/

2 . Click on the Cloud Shell button

![image](/images/azure-shell-open.png)

If you get this prompt, choose bash

![image](/images/azure-shell-bash.png)

If you get this prompt, choose `Azure Pass - Sponsorship` and then click the `Create Storage` button.

![image](/images/azure-shell-storage.png)

{{% notice warning %}}
Creating the storage will take about a minute.
{{% /notice %}}

3 . You should see the bash shell.

![image](/images/azure-shell-prompt.png)

4 . Make a dedicated Azure shell Browser tab by clicking this new tab icon.

![image](/images/azure-shell-newtab.png)

### 2. Verify what subscription your are on

To see which subscription is configured for the Azure CLI, run this command.

```
az account show
```

Look for the name in the output. This is example when a promo code was used.

```
{
  "environmentName": "AzureCloud",
  "homeTenantId": "xxx-xxx-xxx-xx-xxx",
  "id": "yyy-yyyy-yyy-yyy-yyy",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Azure Pass - Sponsorship",   <----- This is the active subscription
  "state": "Enabled",
  "tenantId": "zzz-zzz-zzz-zzz-zzz",
  "user": {
    "name": "name@company.com",
    "type": "user"
  }
}
```

If the subscription is not the one you expect, run this command to see all the subscriptions for your user id. If this is the first time using Azure portal or a trial, then you should only have one subscription.

```
az account list
```

To change subscriptions, identify the subscription name from the account list output and run this command to set it as your default.

```
# this is example, so the scription name you want in quotes
az account set --subscription "Azure Pass - Sponsorship"
```

Then rerun the show command to verify

```
az account show
```

### 3. Clone the workshop scripts

First we need to get some scripts that will automate the workshop setup.

```
git clone https://github.com/dt-demos/modernize-workshop-setup.git
```
