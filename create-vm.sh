#!/bin/bash

local username=""
local project="css-us"
local region="us-central1"
local zone="us-central1-c"
local machine-type=""
local subnet="default"
local address=35.192.239.65
local maintenance-policy="MIGRATE"
local service-account="96327188529-compute@developer.gserviceaccount.com"
local scopes="https://www.googleapis.com/auth/cloud-platform"
local min-cpu-platform="Automatic"
local tags="http-server","https-server"
local image="image-ws2012-mysql57-oracle12c-mssql2012-template"
local image-project="probable-sector-147517"
local boot-disk-size="120"
local boot-disk-type="pd-standard"
local boot-disk-device-name="vm-nregonda-ws2012-tac-cmdline-jobserver-631-00081122"
local address_name="ip-$username-$OS-$components-$version-$salesforce_case"
local instance_name="vm-$username-$OS-$components-$version-$salesforce_case"
local image_name=""
# Create IP
function create_IP() {
  cloud compute addresses create $address_name \
  --region $region \
  --ip-version IPV4
}


# Create instance
function create_instance() {
  gcloud beta compute \
  --project "$project" instances create "$instance_name" \
  --zone $zone \
  --machine-type "custom-16-65536" \
  --subnet "default" \
  --address "$address_name" \
  --maintenance-policy "MIGRATE" \
  --service-account "96327188529-compute@developer.gserviceaccount.com" \
  --scopes "https://www.googleapis.com/auth/cloud-platform" \
  --min-cpu-platform "Automatic" \
  --tags "http-server","https-server" \
  --image "$image_name" \
  --image-project "probable-sector-147517" \
  --boot-disk-size "$boot_disk_size" \
  --boot-disk-type "pd-standard" \
  --boot-disk-device-name "$instance_name"
}


# change/set windows password
function set_windows_password() {
  gcloud compute reset-windows-password "$instance_name" --zone "$zone" --project "$project" --user talend
}
