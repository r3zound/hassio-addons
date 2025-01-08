/usr/bin/phtunnel -l /var/log/phddns/phtunnel.log -c /data/phtunnel.json -r -i 11429 -k adf9fb5a1ad438b9  -f 127.0.0.1:1101 &



#phddns enable
#phddns start
sleep 10
phddns status

while true; do
    sleep 60
    phddns status
done
