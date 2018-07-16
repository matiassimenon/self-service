./elasticsearch-1.5.2/bin/elasticsearch -d
sleep 3
./logstash-1.5.0/bin/logstash agent -f logstash-talend.conf > /dev/null 2>&1 < /dev/null &