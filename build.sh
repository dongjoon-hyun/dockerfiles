#!/usr/bin/env bash

ORG=dongjoon
for DIR in `ls -d */`
do
    docker build -t $ORG/${DIR%%/} ${DIR%%/}
done
