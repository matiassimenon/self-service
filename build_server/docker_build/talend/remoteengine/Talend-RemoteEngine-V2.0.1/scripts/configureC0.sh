# This is NOT a OS shell script, but a Karaf script
# To execute it, open a Karaf shell for your container and type: source scripts/<This script's name>

HTTP_Port=8043
HTTPS_Port=9004
RMI_Registry_Port=1102
RMI_Server_Port=44447
SSH_Port=8104
COMMAND_SERVER_PORT=8003
FILE_SERVER_PORT=8004
MONITORING_PORT=8891

source scripts/configKarafContainer.sh $RMI_Registry_Port $RMI_Server_Port $HTTP_Port $HTTPS_Port $SSH_Port $COMMAND_SERVER_PORT $FILE_SERVER_PORT $MONITORING_PORT
