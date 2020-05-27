# Overview

This repo contains the content for the `Accelerate your cloud migration and modernize your workloads with Azure and Dynatrace` workshop available at http://azure-modernize-workshop.alliances.dynatracelabs.com/

# Feedback

Whether it's a bug report, new feature, correction, or additional documentation, we greatly value feedback and contributions.

You can share your feedback by opening a `new issue` here: https://github.com/dt-demos/azure-modernize-workshop/issues

Please ensure we have all the necessary information to effectively respond to your bug report or contribution such as:
* A reproducible test case or series of steps
* The URL to the page with an issue

# To view and edit content locally

* install [hugo](https://gohugo.io/)
    * macOS: `brew install hugo`
    * Windows: `choco install hugo -confirm`
* clone this repo
* execute in the root folder:
  * `git submodule init`
  * `git submodule update`
* run ```hugo server```
* open website @ http://localhost:1313/

# To publish a change

The `publish.sh` script will set the modified date and sync the content to a Dynatrace AWS S3 bucket.  You will not be able to run this without proper permissions.
