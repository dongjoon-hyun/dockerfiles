#!/bin/bash

hadoop fs -mkdir /table
hadoop fs -mkdir /table/t1
hadoop fs -put data.csv /table/t1

/usr/local/hive/bin/hive -e "create external table table1 (id int, name string, score float, type string) row format delimited fields terminated by '|' stored as textfile location '/table/t1'"
/usr/local/hive/bin/hive -e "select * from table1"
