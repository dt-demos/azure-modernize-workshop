+++
title = "Enable a Problem"
chapter = false
weight = 120
+++

The easyTravel applicaiton has a feature to enable & disable problem patterns built into its codebase so that we can simulate problems.

To enable a problem that Davis will pickup on **workshop-ez-1**, just run these scripts in the Azure cloud shell that will find the IP address for your **workshop-ez-1** instance and make the required HTTP REST call for the feature flag.

{{% notice info %}}
Best to run each problem pattern seperately so that it is easier to analyze. It will take about 4-5 minutes for the problem pattern to manifest.
{{% /notice %}}

### Problem Pattern #1: CPULoadJourneyService
This plugin causes additional high CPU usage when searching for a journey.  It is executed a number of times, regardless whether the requested journey is found or not.

```
cd ~/modernize-workshop-setup
./setProblemPattern-CPULoadJourneyService.sh
```

{{% notice info %}}
The problem pattern will be turned on when the script is called. Turn off the problem pattern by just re-running the command and adding false as a parameter. For example: `./setProblemPattern-CPULoadJourneyService.sh false`
{{% /notice %}}

### Problem Pattern #2: CreditCardCheckError500
Causes Error in the Booking Service. Root cause is Communication plugin could not contact credit card verification application via named pipe in the Booking Service.

```
cd ~/modernize-workshop-setup
./setProblemPattern-CreditCardCheckError500.sh
```

{{% notice info %}}
The problem pattern will be turned on when the script is called. Turn off the problem pattern by just re-running the command and adding false as a parameter. For example: `./setProblemPattern-CreditCardCheckError500 false`
{{% /notice %}}