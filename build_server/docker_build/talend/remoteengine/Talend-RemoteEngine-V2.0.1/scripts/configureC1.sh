# This is NOT a OS shell script, but a Karaf script
# To execute it, open a Karaf shell for your container and type: source scripts/<This script's name>

HTTP_Port=8044
HTTPS_Port=9005
RMI_Registry_Port=1103
RMI_Server_Port=44448
SSH_Port=8105
COMMAND_SERVER_PORT=8013
FILE_SERVER_PORT=8014
MONITORING_PORT=8801

source scripts/configKarafContainer.sh $RMI_Registry_Port $RMI_Server_Port $HTTP_Port $HTTPS_Port $SSH_Port $COMMAND_SERVER_PORT $FILE_SERVER_PORT $MONITORING_PORT
