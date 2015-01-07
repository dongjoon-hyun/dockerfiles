#!/bin/bash

/usr/local/spark/bin/spark-submit --class org.apache.spark.examples.SparkPi --master yarn-cluster --driver-memory 1g --executor-memory 1g --executor-cores 1 $SPARK_HOME/lib/spark-examples-1.2.0-hadoop2.4.0.jar
