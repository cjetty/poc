#!/bin/bash
loop_count=$1
interface="eth0"
out_file="pcap_generated_file.pcap"
input_file="port0_2022_7_1_8_29_51_0.pcap"
dest_mac=$2

#tcprewrite --infile=$input_file --outfile=$out_file --enet-dmac=$dest_mac,$dest_mac
#echo "New PCAP file has been generated"
echo "Started to push packets to destination"
tcpreplay-edit -i eth0 --loop=$loop_count --enet-dmac=$dest_mac,$dest_mac  $input_file
#tcpreplay-edit --loop=5 -i $interface --enet-dmac=02:42:16:72:81:dd,02:42:16:72:81:dd /app/data/port0_2022_7_1_8_29_51_0.pcap
#tcpreplay-edit --loop=2 -i enp0s3 --enet-dmac=02:42:16:72:81:dd,02:42:16:72:81:dd /app/data/port0_2022_7_1_8_29_51_0.pcap