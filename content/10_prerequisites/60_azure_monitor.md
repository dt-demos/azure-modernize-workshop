+++
title = "Azure Monitor"
chapter = false
weight = 60
+++

![image](/images/jess.png)

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
