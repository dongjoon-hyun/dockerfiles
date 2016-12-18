#!/usr/bin/env bash

ORG=dongjoon
TARGET=${1:-`ls -d */`}
for DIR in $TARGET
do
    docker build -t $ORG/${DIR%%/} ${DIR%%/}
done
