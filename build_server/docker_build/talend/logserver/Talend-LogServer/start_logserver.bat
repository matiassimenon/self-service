@echo off
set home=sincedb
set LS_MAX_MEM=256m
start elasticsearch-1.5.2\bin\elasticsearch.bat
logstash-1.5.0\bin\logstash agent -f logstash-talend.conf
