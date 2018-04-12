#!/bin/bash

Settings_Topic[1]='/Boat/Buzzer/WBuzzer'
Settings_Payload[1]='5,250-750-5,250-750-5,250'

Settings_Topic[2]='/Boat/All'
Settings_Payload[2]='Relay-OFF'

Settings_Topic[3]='/Boat/All'
Settings_Payload[3]='Dimmer-OFF'

zzzZZZ_Delay=5


# Play note
mosquitto_pub -h localhost -t ${Settings_Topic[1]} -m ${Settings_Payload[1]} -u DasBoot -P NoSinking


sleep $zzzZZZ_Delay


for (( i=2; i<=${#Settings_Topic[@]}; i++ ))
do
  mosquitto_pub -h localhost -t ${Settings_Topic[i]} -m ${Settings_Payload[i]} -u DasBoot -P NoSinking
  sleep 1
done

exit 0
