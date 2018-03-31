#!/bin/bash
cd "/talend/cmdline"
JAVA_CMD=java
if [ -x $JAVA_HOME/bin/java ]; then
  JAVA_CMD=$JAVA_HOME/bin/java
fi
#$JAVA_CMD -Xms64m -Xmx1024m -Dfile.encoding=utf-8 -jar /talend/cmdline/plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar --disableShellInput -nosplash -application org.talend.commandline.CommandLine -consoleLog -data commandline-workspace startServer -p 8002 > /dev/null 2>&1 < /dev/null &
$JAVA_CMD -Xms64m -Xmx1024m -Dfile.encoding=utf-8 -jar /talend/cmdline/plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar -nosplash -application org.talend.commandline.CommandLine -consoleLog -data commandline-workspace startServer -p 8002
