#!/bin/bash
loop_count=$1
interface="eth0"
pod_role=$2

echo "Given parameters are $loop_count, $interface, $pod_role"

if [ "$pod_role" = "ru" ]
then
  dest_mac=`curl -X GET http://du-service/mac/`
  input_file="ru_captured.pcap"
else
  dest_mac=`curl -X GET http://ru-service/mac/`
  input_file="port0_2022_7_1_8_29_51_0.pcap"
  curl -X POST http://ru-service/tcp_capture/ -H 'Content-Type: application/json' -d '{"action": "start"}'
fi

echo "Started to push packets to destination"
tcpreplay-edit -i eth0 --loop=$loop_count --enet-dmac=$dest_mac,$dest_mac  $input_file

if [ "$pod_role" != "ru"  ] 
then
  echo "Stopping tcpdump capture on the RU pod"
  curl -X POST http://ru-service/tcp_capture/ -H 'Content-Type: application/json' -d '{"action": "stop"}'
  echo "Starting tcpdump capture on DU pod"
  curl -X POST http://du-service/tcp_capture/ -H 'Content-Type: application/json' -d '{"action": "start"}'
  echo "Now starting the packet transfer from RU server"
  curl -X POST http://ru-service/action/ -H 'Content-Type: application/json' -d '{"loop": 5, "pod_role": "ru", "action": "start"}'
fi