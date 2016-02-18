Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* Debian 8.2
* Hadoop 2.7.2
* Spark 1.6.0
* Elasticsearch 2.2.0
* Hive 2.0.0
* Python 2.7.9
* IPython 4.1.1

Run
---
You can build and run a cluster easily.

> $ sudo docker pull dongjoon/java8-hdw

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/java8-hdw/run-cluster.sh)"

> ...

> $ root@hnn-001-01:~# ./init-spark.sh 

> $ root@hnn-001-01:~# spark-submit --master yarn-client /usr/local/spark/examples/src/main/python/pi.py

> $ root@hnn-001-01:~# ./test-hive.sh 

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
