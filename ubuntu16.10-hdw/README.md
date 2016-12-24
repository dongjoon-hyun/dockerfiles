[![](https://images.microbadger.com/badges/image/dongjoon/ubuntu16.10-hdw.svg)](https://microbadger.com/images/dongjoon/ubuntu16.10-hdw)
[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](LICENSE)

Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* Ubuntu 16.10
* Oracle JDK 1.8.0_101
* Apache Hadoop 2.7.3
* Apache Spark 2.1.0
* Elasticsearch 5.0.0
* Apache Hive 2.1.1
* Python 2.7.12
* IPython 5.1.0

Run
---
You can build and run a cluster easily.

> $ sudo docker pull dongjoon/ubuntu16.10-hdw

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/ubuntu16.10-hdw/run-cluster.sh)"

> ...

> $ root@hnn-001-01:~# ./test-hive.sh

> $ root@hnn-001-01:~# run-example SparkPi

> $ root@hnn-001-01:~# spark-shell

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
