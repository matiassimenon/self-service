#
#
# Copyright (C) 2011 - 2012 Talend Inc.
# %%
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#      http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This is NOT a OS shell script, but a Karaf script
# To execute it, open a Karaf shell for your container and type: source scripts/<This script's name>

echo "Configure Event Logging with REST communication"

echo "Please make sure ActiveMQ Broker is started before continue ..."
sleep 10000

echo
echo "Stopping SAM Service ..."
feature:stop tesb-sam-service-soap

echo
echo "Install Event Logging features ..."
feature:install tesb-el-elasticsearch
feature:install tesb-el-server
feature:install tesb-el-collector-direct
feature:install tesb-el-rest-service
feature:install tesb-el-sender-rest
feature:install tesb-el-agent
feature:install tesb-el-dlq
feature:install tesb-el-mdc-mapper

echo
echo "Make changes to the configuration ..."
config:edit --force org.talend.eventlogging.server
config:property-set persistence.event.db.active.default false
config:property-set search.active.default true
config:property-set elasticsearch.available true
config:update

config:edit --force org.talend.eventlogging.agent
echo "agent.id = $1"
config:property-set agent.id $1
config:update

echo
echo "Install Event Logging listeners ..."
feature:install tesb-el-listener-log
feature:install tesb-el-listener-osgi
feature:install tesb-locator-monitor
feature:install tesb-el-listener-sam

echo
echo "Event Logging Configuration finished successfully."