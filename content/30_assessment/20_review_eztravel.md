---
title: Review easyTravel
chapter: false
weight: 20
---

![image](/images/florian.png)

1 . Open the Azure portal (http://portal.azure.com) and open the Virtual Machine (VM) page. One way to do this is search for virtual machines

2 . Open the VM called **workshop-ez-1**. On the VM overview page, you can see that this is a Linux (ubuntu 18.04) host.

![image](/images/azure-search-vm.png)

## Dynatrace OneAgent

In addition to installing easyTravel on this host, the Azure CLI was used to install the Dynatrace OneAgent [Azure VM extension](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/overview).

To see what was installed, click the `Extensions` host menu.

![image](/images/agent-extension.png)

Here is the Azure CLI command that was used:

```
az vm extension set \
    --publisher dynatrace.ruxit \
    --name "$AGENT" \
    --resource-group "$AZURE_RESOURCE_GROUP" \
    --subscription "$AZURE_SUBSCRIPTION" \
    --vm-name "$HOSTNAME" \
    --settings "{\"tenantId\":\"$DT_ENVIRONMENT_ID\",\"token\":\"$DT_PAAS_TOKEN\", \"server\":\"$DT_BASEURL/api\", \"hostGroup\":\"$HOSTGROUP_NAME\"}
```

{{% notice info %}}
Learn more about the Dyntrace Azure extentions using the Azure portal, Azure CLI, Powershell, ARM templates in the [Dynatrace documentation](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/microsoft-azure/azure-services/virtual-machines/deploy-oneagent-on-azure-virtual-machines/)
{{% /notice %}}

## Open the easyTravel application

1 . On the right side of overview page, use the copy button to copy the “public IP” for this VM.

![image](/images/azure-vm-overview.png)

2 . Then in a Browser, visit **http://PUBLIC-IP** to view the EasyTravel application. You should see a webpage that looks like this:

![image](/images/eztravel-orange.png)

{{% notice info %}}
If the application does not appear, then verify the `provisionAzureWorkshop.sh` script has completed.
{{% /notice %}}