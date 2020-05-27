+++
title = "Workshop Setup"
chapter = false
weight = 40
+++

![image](/images/jess.png)

In this section, your will complete the following:

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

### 4. Capture environment and token info

{{% notice warning %}}
The next set of steps assume that your Dynatrace tenant is fully provisioned and you are logged in. 
{{% /notice  %}}

Gather environment and token info To configure and deploy easyTravel and for exercises later in the workshop, we will need the following info from your Dynatrace environment

* Base URL
* Environment ID
* API token
* PaaS token

And we will need the following from your Azure subscription:

* Subscription ID


For this, have provided a simple UNIX shell script for this workshop that prompts for these values and writes them to a file called `creds.json`. Later in the workshop steps, there are a few other simple UNIX shell that will automate the step that read this file so that you don’t need to type or copy-paste these values over and over agaan during the workshop.

So start by running this script that will provide prompts. Follow the sections below to get these values and paste them against the prompt. If you mess up, you can re-run the script.

1 . run UNIX shell script

```
cd ~/modernize-workshop-setup/azure
./inputAzureWorkshopCredentials.sh
```

2 . Login into Dynatrace

{{% notice info %}}
You can always login to your tenant using the URL https://[ENVIRONMENT ID].live.dynatrace.com/ or by using the the SaaS login link on the top right of the Dynatrace home page.
{{% /notice %}}

#### Input 1 of 6: Your last name
In the UNIX terminal, enter your last name at the prompt. This will be added as a prefix for the Azure resource group name.

#### Input 2 of 6: Dynatrace Base URL

1 . Copy the Dynatrace base URL from your browser, for example: **https://[ENVIRONMENT ID].live.dynatrace.com**

{{% notice warning %}}
Do not include the trailing backslash at URL.
{{% /notice %}}

2 . Back in the UNIX terminal, paste the value for the `Dynatrace Base URL` prompt.

#### Input 3 of 6: Dynatrace Environment ID

1 . From the Dynatrace left side menu, select Deploy Dynatrace. Then Click the Setup PaaS integration button

![image](/images/dt-paas-setup.png)

2 . Click the Copy button under the environment ID.

![image](/images/dt-paas-environment.png)

3 . Back in the UNIX terminal, paste the value for the `Dynatrace Environment ID` prompt

#### Input 4 of 6: Dynatrace PaaS Token

1 . On this same page. click the Generate new token button.

![image](/images/dt-paas-token-generate.png)

2 . click the Generate button, and then enter a name for your token (e.g. workshop)

![image](/images/dt-paas-token-settings.png)

3 . then the Copy button

![image](/images/dt-paas-token-copy.png)

4 . Back in the UNIX terminal, paste the value for the `Dynatrace PaaS token` prompt

#### Input 5 of 6: Dynatrace API Token

1 . From the Dynatrace left side menu, navigate to: Settings -> Integration -> Dynatrace API

2 . Click on the Generate Token button

![image](/images/dt-api-token-create.png)

3 . Enter a name for your token (e.g. workshop)

4 . Leave the default options and click Generate

![image](/images/dt-api-token-settings.png)

5 . Expand the newly created token, copy the token value and paste it to your bastion terminal script prompt : API token

![image](/images/dt-api-token-copy.png)

6 . Back in the UNIX terminal, paste the value for the `Dynatrace PaaS token` prompt

#### Input 6 of 6: Azure subscription

1 . Open a new browser with for azure portal

2 . Search for subscriptions and open the subscriptions page

![image](/images/azure-search-subscription.png)

3 . Form the list of subscriptions, copy the Subscription ID of your Azure subscription using the copy button

![image](/images/azure-copy-subscription.png)

4 . Back in the UNIX terminal, paste the value for the `Azure subscription ID` prompt

### Verify

Your completed data entry, should look like this.

```
Please confirm all are correct:

Dynatrace Base URL       : https://MY-ENVIONMENT.live.dynatrace.com
Dynatrace Environment ID : MY-ENVIONMENT
Dynatrace PaaS Token     : MY-PAAS-TOKEN
Dynatrace API Token      : MY-API-TOKEN
Azure Subscription ID    : xxxx-xxxx-xxxx-xxxx-xxxxxxxx
Is this correct? (y/n): y
```

After you confirm, the script will show the saved values in the `creds.jso`n file. You can view again by simply typing cat `creds.json`. NOTE that the Azure Location and Azure Resource Group are pre-configured.

If you mess up, you can re-run the script again and will prompt you again for each value.

```
cd ~/modernize-workshop-setup/azure
/inputAzureWorkshopCredentials.sh
```

### 7. Setup Azure monitor

This step will add an Azure Service Principal and the Dynatrace configuration needed for the Dynatrace Azure monitor.

{{% notice warning %}}
If you are using your own or corporate subscription, you may NOT have the permissions to create a service principal and will get an error if that is the case. You can skip running this script and following the [Dynatrace Azure Monitor Setup Documentation](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/microsoft-azure/azure-services/azure-monitor/).
{{% /notice %}}

#### What exactly is this script doing?

1 . Azure resources

* Add Service Principal with reader permissions. This is needed for the Azure monitor integration

2 . Dynatrace configuration

* Add an Azure monitor configuration using the secrets from new Azue Service Principal

#### Run the script

1 . run these commands to start the provisioning process

```
cd ~/modernize-workshop-setup/azure
./createAzureMonitorServicePrincipal.sh
```

The script output will look like this:

```
==========================================
Adding Azure monitor for Dynatrace
Starting: Tue May 26 18:03:51 EDT 2020
==========================================
Seeing if jahn-azure-modernize-workshop-sp exists
Deleting existing jahn-azure-modernize-workshop-sp
Removing role assignments
Adding YOURNAME-azure-modernize-workshop-sp
Creating a role assignment under the scope of "/subscriptions/111-222-333-444-555"
  Retrying role assignment creation: 1/36
Adding Dynatrace config needed for Azure monitor
===================================================================================
Checking if azure/credentials azure-modernize-workshop exists
Deleting azure/credentials azure-modernize-workshop (ID = AZURE_CREDENTIALS-11111)
Waiting 10 seconds to ensure azure-modernize-workshop is deleted
Adding azure/credentials azure-modernize-workshop
{"id":"AZURE_CREDENTIALS-11111","name":"azure-modernize-workshop"}
=============================================
Adding Azure monitor for Dynatrace COMPLETE
End: Tue May 26 18:04:17 EDT 2020
=============================================
```

### 6. Provision workshop

This step will provision several Azure resources and the Dynatrace configuration needed for the workshop.

#### What exactly is this script doing?

1 . Azure resources

* Add a Resource Group for all the VMs named: **YOURNAME-azure-modernize-workshop**
* Add VM named: **workshop-ez-1**. At startup, it installs Docker and the EZ travel application. OneAgent is installed using Azure extension
* Add VM named: **workshop-ez-docker-1**. At startup, it installs Docker and the EZ travel application. OneAgent is installed using Azure extension
* Add VM named: **workshop-active-gate-1**. At startup, it installs the Dynatrace ActiveGate process needed for the Azure monitor integration.

2 . Dynatrace configuration

* Set global [Frequent Issue Detection](https://www.dynatrace.com/support/help/how-to-use-dynatrace/problem-detection-and-analysis/problem-detection/detection-of-frequent-issues/) settings to Off
* Adjust the [Service Anomaly Detection](https://www.dynatrace.com/support/help/how-to-use-dynatrace/problem-detection-and-analysis/problem-detection/how-to-adjust-the-sensitivity-of-problem-detection/) global settings
* Add a [custom Java sensor](https://www.dynatrace.com/support/help/how-to-use-dynatrace/transactions-and-services/configuration/define-custom-services/) for the CheckDestination backend service
* Add [Management Zones](https://www.dynatrace.com/support/help/how-to-use-dynatrace/management-zones/) for ez-travel and ez-travel-docker
* Add modernize-workshop [dashboard](https://www.dynatrace.com/support/help/how-to-use-dynatrace/dashboards-and-charts/)
* Add autoTagging rule for a [tag](https://www.dynatrace.com/support/help/how-to-use-dynatrace/tags-and-metadata/) called workshop-group.
* Add [application](https://www.dynatrace.com/support/help/how-to-use-dynatrace/real-user-monitoring/setup-and-configuration/web-applications/initial-configuration/define-your-applications-via-the-my-web-application-placeholder/) for EasyTravelOrange and EasyTravelOrangeDocker

#### Run the script

1 . run these commands to start the provisioning process

```
cd ~/modernize-workshop-setup/azure
./provisionAzureWorkshop.sh
```

{{% notice warning %}}
The process to provision each Virtual Machine make take 5-10 minutes, so please be patient
{{% /notice %}}

2 . You can let this script run while we move to the the next section.

The start of the script output will look like this:

```
==========================================
Provisioning Azure workshop resources
==========================================

*** Provisioning 1 hosts of type ez ***
Using resource group azure-modernize-workshop
Provisioning ez (1 of 1): Starting: Thu May 14 22:20:33 EDT 2020
...
...
Eventually when it completes, it will look like this:

...
...
=============================================
Provision Azure workshop resources COMPLETE
=============================================
```

### Checklist

In this section, you should have completed the following:

:white_check_mark: Used the Azure Cloud Shell and ran various UNIX commands

:white_check_mark: Captured environment and token info needed for automation scripts

:white_check_mark: Provisioned workshop Azure resources