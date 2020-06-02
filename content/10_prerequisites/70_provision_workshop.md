+++
title = "Provision Workshop"
chapter = false
weight = 70
+++

![image](/images/jess.png)

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