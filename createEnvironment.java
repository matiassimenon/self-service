POST https://www.googleapis.com/compute/v1/projects/css-us/zones/us-east1-d/instances
{
  "name": "vm-vmahendrakar-ws2012-remoteenginev20179-00089998",
  "zone": "projects/css-us/zones/us-east1-d",
  "minCpuPlatform": "Automatic",
  "machineType": "projects/css-us/zones/us-east1-d/machineTypes/n1-standard-4",
  "metadata": {
    "items": []
  },
  "tags": {
    "items": [
    "http-server",
    "https-server" ] }, "disks": [
    { "type": "PERSISTENT",
    "boot": true,
    "mode": "READ_WRITE",
    "autoDelete": true,
    "deviceName": "vm-vmahendrakar-ws2012-remoteenginev20179-00089998",
    "initializeParams": {
      "sourceImage": "projects/probable-sector-147517/global/images/image-ws2012-mysql57-oracle12c-template",
      "diskType": "projects/css-us/zones/us-east1-d/diskTypes/pd-standard",
      "diskSizeGb": "100"
    }
  }
  ],
  "canIpForward": false,
  "networkInterfaces": [
  { "network": "projects/css-us/global/networks/default",
  "subnetwork": "projects/css-us/regions/us-east1/subnetworks/default",
  "accessConfigs": [
  {
    "name": "External NAT",
    "type": "ONE_TO_ONE_NAT",
    "natIP": "35.196.127.50"
  }
  ],
  "aliasIpRanges": []
}
], "description": "",
"labels": {
  "owner": "vmahendrakar",
  "salesforce-case": "00089998",
  "client": "amsurg",
  "archive-date": "none",
  "scheduler": "none-1800-est-weekdays"
}, "scheduling": {
  "preemptible": false,
  "onHostMaintenance": "MIGRATE",
  "automaticRestart": true
},
"deletionProtection": false,
"serviceAccounts": [ {
  "email": "96327188529-compute@developer.gserviceaccount.com",
  "scopes": [ "https://www.googleapis.com/auth/cloud-platform"
  ]
}
]
}
