#!/bin/bash
cd "/talend/"
java -jar telnet.jar localhost 8002 initLocal
java -jar telnet.jar localhost 8002 stopServer
