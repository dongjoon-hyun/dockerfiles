[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](LICENSE)
[![](https://badge.imagelayers.io/dongjoon/centos7-hdw:latest.svg)](https://imagelayers.io/?images=dongjoon/centos7-hdw:latest)

Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* CentOS 7.2
* Hadoop 2.7.2
* Spark 1.6.1
* Elasticsearch 2.2.1
* Hive 2.0.0
* Python 2.7.5
* IPython 4.1.1

Run
---
You can build and run a cluster easily.

> $ sudo docker pull dongjoon/centos7-hdw

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/centos7-hdw/run-cluster.sh)"

> ...

> $ root@hnn-001-01:~# ./init-spark.sh 

> $ root@hnn-001-01:~# spark-submit --master yarn-client /usr/local/spark/examples/src/main/python/pi.py

> $ root@hnn-001-01:~# ./test-hive.sh 

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
