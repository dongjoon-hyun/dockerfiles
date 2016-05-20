[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](LICENSE)
[![](https://badge.imagelayers.io/dongjoon/ubuntu16.04-hdw:latest.svg)](https://imagelayers.io/?images=dongjoon/ubuntu16.04-dev:latest)

Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* Ubuntu 16.04 LTS
* JDK 1.8.0_91
* Hadoop 2.7.2
* Spark 2.0.0 Preview
* Elasticsearch 2.3.3
* Hive 2.0.0
* Python 2.7.11
* IPython 4.2.0
* Toree 0.1.0 (Not Working)

Run
---
You can build and run a cluster easily.

> $ sudo docker pull dongjoon/ubuntu16.04-dev

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/ubuntu16.04-dev/run-cluster.sh)"

> ...

> $ root@hnn-001-01:~# spark-submit --master yarn-client /usr/local/spark/examples/src/main/python/pi.py

> $ root@hnn-001-01:~# ./test-hive.sh 

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
