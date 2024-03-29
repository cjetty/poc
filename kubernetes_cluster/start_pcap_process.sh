#!/bin/sh
loop_count=$1
interface="eth0"
pod_role=$2


echo "Given parameters are $loop_count, $interface, $pod_role"

if [ "$pod_role" = "du"  ] 
then
  dest_mac=`curl -X GET http://ru-service/mac/`
  input_file="port0_2022_7_1_8_29_51_0.pcap"
  echo "Started to push packets from DU to RU"
  tcpreplay-edit -i eth0 --loop=$loop_count --enet-dmac=$dest_mac,$dest_mac  $input_file
  #echo "Stopping tcpdump capture on the RU pod"
  #curl -X POST http://ru-service/tcp_capture/ -H 'Content-Type: application/json' -d '{"action": "stop"}'
  #echo "Starting tcpdump capture on DU pod"
  #curl -X POST http://du-service/tcp_capture/ -H 'Content-Type: application/json' -d '{"action": "start"}'
  echo "Now starting the packet transfer from RU server"
  curl -X POST http://ru-service/action/ -H 'Content-Type: application/json' -d '{"loop": 1, "pod_role": "ru", "action": "start"}'
else
  dest_mac=`curl -X GET http://du-service/mac/`
  input_file="/pod_volume/ru_captured_copy.pcap"
  echo "Started to push packets from RU to DU"
  cp /pod_volume/ru_captured.pcap  /pod_volume/ru_captured_copy.pcap
  tcpreplay-edit -i eth0 --loop=$loop_count --enet-dmac=$dest_mac,$dest_mac  $input_file
  #echo "Stopping tcpdump capture on DU pod"
  #curl -X POST http://du-service/tcp_capture/ -H 'Content-Type: application/json' -d '{"action": "stop"}'
fi