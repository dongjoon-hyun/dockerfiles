#!/bin/bash

hadoop fs -mkdir /table
hadoop fs -mkdir /table/t1
hadoop fs -put data.csv /table/t1
/usr/local/tajo/bin/tsql -c "create external table table1 (id int, name text, score float, type text) using csv with ('csvfile.delimiter'='|') location '/table/t1'"
/usr/local/tajo/bin/tsql -c "select * from table1"
