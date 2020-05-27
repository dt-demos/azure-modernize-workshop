#!/bin/bash

echo ""
echo "-----------------------------"
echo "Publishing site content"
echo "-----------------------------"

echo "Step 1: Update date"
sed -i "" 's/Last Updated:.*/Last Updated: '"$(date)"'/g' ./layouts/partials/menu-footer.html

echo "Step 2: Compile Site"
hugo -c ./content

echo "Step 3: Sync to S3"
aws s3 sync public/ s3://azure-modernize-workshop.alliances.dynatracelabs.com 

echo "-----------------------------"
echo "Done"
echo "-----------------------------"
echo ""



