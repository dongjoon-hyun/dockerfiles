#!/bin/bash

for host in `grep 172 /etc/hosts | awk '{print $1}'`
do
    ssh $host service elasticsearch start
done
