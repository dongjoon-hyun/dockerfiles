[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](LICENSE)
[![](https://badge.imagelayers.io/dongjoon/java7-hdw:latest.svg)](https://imagelayers.io/?images=dongjoon/java7-hdw:latest)

Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* Debian 8.5
* Hadoop 2.7.2
* Spark 1.6.1
* Elasticsearch 2.3.3
* Hive 2.1.0
* Python 2.7.9
* IPython 4.2.0
* Toree 0.1.0

Run
---
You can build and run a cluster easily.

> $ sudo docker pull dongjoon/java7-hdw

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/java7-hdw/run-cluster.sh)"

> ...

> $ root@hnn-001-01:~# spark-submit --master yarn-client /usr/local/spark/examples/src/main/python/pi.py

> $ root@hnn-001-01:~# ./test-hive.sh 

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
