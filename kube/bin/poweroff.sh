#!/bin/bash

for host in node1 node2 node3 minikube
do
    ping -c 1 -W 1 $host >/dev/null 2>&1 \
        && ssh $host poweroff
    sleep 3
done

sleep 2
poweroff

