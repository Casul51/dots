#!/bin/bash

master_ip=192.168.

declare -a ips=(
[0]=192.168.
[1]=192.168.
[2]=192.168.
[3]=192.168.
[4]=192.168.
[5]=192.168.
[6]=192.168.
[7]=192.168.
)



for i in ${ips[@]}
do
    ssh-copy-id root@$i
    ssh root@$i "ssh-copy-id root@$master_ip"
    ssh root@$i "apt update ; apt install -y sshfs ; apt install -y curl wget"
    ssh root@$i "mkdir /share && sshfs root@$master_ip:/share /share"
    ssh root@$i "curl https://getmic.ro | bash" &

done
