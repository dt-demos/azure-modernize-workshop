+++
title = "Azure Cleanup"
chapter = false
weight = 10
+++

{{% notice warning %}}
In order to prevent charges to your subscription we recommend cleaning up the infrastructure that was created. If you plan to keep things running so you can examine the workshop a bit more please remember to do the cleanup when you are done. It is very easy to leave things running in an Azure subscription, forget about it, and then accrue charges.
{{% /notice %}}

### Delete Service Principal

The Dynatrace Azure monitor setup also made a Service Principal that is used to pull data. In the Azure portal, the term `App registration` is used.

1 . First navigate to the `App registration` page and click on the entry with `azure-modernize-workshop-sp` in the name

![image](/images/sp-search.png)

2 . Then just click delete

![image](/images/sp-delete.png)

### Delete resource group

You just need to delete the resource group named `azure-modernize-workshop` and all the Azure resources will be deleted.

1 . Open the resource group page. One way is to just search for it

![image](/images/azure-search-rg.png)

2 . Open the resource group named azure-modernize-workshop

![image](/images/azure-open-rg.png)

3 . Click the Delete resource group button and retype the name to confirm the delete.

![image](/images/azure-delete-rg.png)

### Thats it! All cleaned up

{{% notice warning %}}
The delete will take 5-10 minutes.
{{% /notice %}}

