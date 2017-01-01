#!/bin/bash

/usr/sbin/sshd

/root/sync-hosts.sh

grep hdw /etc/hosts | awk '{print $1}' > /usr/local/hadoop/etc/hadoop/slaves
for host in `grep 172 /etc/hosts | awk '{print $1}'`
do
    echo $host
    scp /usr/local/hadoop/etc/hadoop/slaves $host:/usr/local/hadoop/etc/hadoop/slaves
done

/usr/local/hadoop/bin/hdfs namenode -format
/usr/local/hadoop/sbin/start-dfs.sh
/usr/local/hadoop/sbin/start-yarn.sh

cd ~ && /bin/bash
