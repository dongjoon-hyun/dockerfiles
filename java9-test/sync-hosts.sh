#!/bin/bash

for host in `grep 172 /etc/hosts | awk '{print $1}'`
do
    echo $host
    scp /etc/hosts $host:/etc/hosts
done
