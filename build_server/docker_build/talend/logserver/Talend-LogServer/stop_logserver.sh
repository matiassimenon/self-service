#!/bin/sh
PS_LOGSERVER_VAR=`ps aux | grep 'logstash' | grep -v grep`
if [ -n "$PS_LOGSERVER_VAR" ]; then
  kill $(echo $PS_LOGSERVER_VAR | awk '{print $2}')
fi

PS_ELASTICSEACH_VAR=`ps aux | grep 'elasticsearch' | grep -v grep`
if [ -n "$PS_ELASTICSEACH_VAR" ]; then
  kill $(echo $PS_ELASTICSEACH_VAR | awk '{print $2}')
fi
