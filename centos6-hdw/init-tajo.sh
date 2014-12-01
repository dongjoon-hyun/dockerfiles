#!/bin/bash

grep hdw /etc/hosts | awk '{print $1}' > /usr/local/hadoop/etc/hadoop/slaves
for host in `grep 172 /etc/hosts | awk '{print $1}'`
do
    echo $host
    scp /usr/local/hadoop/etc/hadoop/slaves $host:/usr/local/tajo/conf/workers
done

/usr/local/hadoop/bin/hadoop fs -mkdir /tajo
/usr/local/hadoop/bin/hadoop fs -chmod g+w /tajo
