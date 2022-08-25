#!/bin/bash
loop_count=$1
interface="eth0"
input_file="port0_2022_7_1_8_29_51_0.pcap"

$local_mac=`curl -X GET http://du-service/mac/`

if [ ! -z "$2" ]
then
  $dest_mac = $2
else
  $dest_mac=`curl -X GET http://ru-service/mac/`
fi

echo "Started to push packets to destination"
tcpreplay-edit -i eth0 --loop=$loop_count --enet-dmac=$dest_mac,$dest_mac  $input_file
ECHO "Now starting the packet transfer from RU server"
curl -X POST http://ru-service/action/ -H 'Content-Type: application/json' -d "{'loop': 5, 'dest_mac_address': $local_mac, 'action': "start"}"
#tcpreplay-edit --loop=5 -i $interface --enet-dmac=02:42:16:72:81:dd,02:42:16:72:81:dd /app/data/port0_2022_7_1_8_29_51_0.pcap
#tcpreplay-edit --loop=2 -i enp0s3 --enet-dmac=02:42:16:72:81:dd,02:42:16:72:81:dd /app/data/port0_2022_7_1_8_29_51_0.pcap