[![](https://images.microbadger.com/badges/image/dongjoon/ubuntu16.04-hdw.svg)](https://microbadger.com/images/dongjoon/ubuntu16.04-hdw)
[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](LICENSE)

Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* Ubuntu 16.04 LTS
* Hadoop 2.7.3
* Spark 2.1.0
* Elasticsearch 2.4.2
* Hive 2.1.1
* Python 2.7.12
* IPython 5.1.0

Run
---
You can build and run a cluster easily.

> $ sudo docker pull dongjoon/ubuntu16.04-hdw

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/ubuntu16.04-hdw/run-cluster.sh)"

> ...

> $ root@hnn-001-01:~# ./test-hive.sh

> $ root@hnn-001-01:~# run-example SparkPi

> $ root@hnn-001-01:~# spark-shell

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
