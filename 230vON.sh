#!/bin/bash

Settings_Topic[1]='/Boat/Relay/WR1/4'
Settings_Payload[1]='1'

Settings_Topic[2]='/Boat/Relay/WR1/5'
Settings_Payload[2]='1'

for (( i=1; i<=${#Settings_Topic[@]}; i++ ))
do
  mosquitto_pub -h localhost -t ${Settings_Topic[i]} -m ${Settings_Payload[i]} -u DasBoot -P NoSinking
  sleep 0.250
done

exit 0
