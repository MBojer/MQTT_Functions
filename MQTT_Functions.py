#!/usr/bin/python

import subprocess
import paho.mqtt.client as mqtt
from pathlib2 import Path


# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))

    # Subscribing in on_connect() means that if we lose the connection and
    # reconnect then subscriptions will be renewed.
    client.subscribe("/Boat/Functions")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):

    Payload = msg.payload

    Search_String = "/home/bojer/MQTT_Functions/" + Payload + ".sh"

    Settings_File = Path(Search_String)

    if Settings_File.is_file():
        print "Executing fucntion: " + Payload
        subprocess.call(Search_String, shell=True)


client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message
client.username_pw_set("DasBoot", "NoSinking")


client.connect("192.168.0.2", 1883, 60)

# Blocking call that processes network traffic, dispatches callbacks and
# handles reconnecting.
# Other loop*() functions are available that give a threaded interface and a
# manual interface.
client.loop_forever(timeout=1.0, max_packets=1, retry_first_connection=False)
