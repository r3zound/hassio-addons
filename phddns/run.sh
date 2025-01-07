phddns enable
phddns start
sleep 10
phddns status

while true; do
    sleep 60
    phddns status
done
