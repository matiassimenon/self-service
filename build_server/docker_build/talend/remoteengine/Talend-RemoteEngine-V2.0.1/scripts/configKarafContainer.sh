# This is NOT a OS shell script, but a Karaf script
# To execute it, open a Karaf shell for your container and type: source scripts/<This script's name>

echo "Start configuring ......"

echo
echo "JMX Management configuration (PID: org.apache.karaf.management.cfg)"
config:edit --force org.apache.karaf.management
echo "rmiRegistryPort = $1"
config:property-set rmiRegistryPort $1
echo "rmiServerPort = $2"
config:property-set rmiServerPort $2
config:property-set serviceUrl service:jmx:rmi://\${rmiServerHost}:\${rmiServerPort}/jndi/rmi://\${rmiRegistryHost}:\${rmiRegistryPort}/karaf-\${karaf.name}
config:update

echo
echo "OSGI HTTP/HTTPS Service configuration (Pid: org.ops4j.pax.web.cfg)"
config:edit --force org.ops4j.pax.web
echo "org.osgi.service.http.port = $3"
config:property-set org.osgi.service.http.port $3
echo "org.osgi.service.http.port.secure = $4"
config:property-set org.osgi.service.http.port.secure $4
config:update

echo
echo "Karaf SSH shell configuration (Pid: org.apache.karaf.shell.cfg)"
config:edit --force org.apache.karaf.shell
echo "sshPort = $5"
config:property-set sshPort $5
config:update

echo
echo "Jobserver configuration (Pid: org.talend.remote.jobserver.server.cfg)"
config:edit --force org.talend.remote.jobserver.server
echo "org.talend.remote.jobserver.server.TalendJobServer.COMMAND_SERVER_PORT = $6"
config:property-set org.talend.remote.jobserver.server.TalendJobServer.COMMAND_SERVER_PORT $6
echo "org.talend.remote.jobserver.server.TalendJobServer.FILE_SERVER_PORT = $7"
config:property-set org.talend.remote.jobserver.server.TalendJobServer.FILE_SERVER_PORT $7
echo "org.talend.remote.jobserver.server.TalendJobServer.MONITORING_PORT = $8"
config:property-set org.talend.remote.jobserver.server.TalendJobServer.MONITORING_PORT $8
config:update

echo
echo "Configuration finished successfully."