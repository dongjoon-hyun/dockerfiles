[![](https://images.microbadger.com/badges/image/dongjoon/hadoop3.svg)](https://microbadger.com/images/dongjoon/hadoop3)
[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](LICENSE)

Hadoop Data Warehouse
====================

Components
----------
This is a test cluster for Apache Hadoop 3.0.0-alpha1

* Debian 8.5
* Hadoop 3.0.0-alpha1
* Spark 2.0.0
* Hive 2.1.0

Run
---
You can build and run a cluster easily.

> $ sudo docker pull dongjoon/hadoop3

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/hadoop3/run-cluster.sh)"

> ...

> $ root@hnn-001-01:~# spark-submit --master yarn-client /usr/local/spark/examples/src/main/python/pi.py

> $ root@hnn-001-01:~# ./test-hive.sh

> ...

> $ root@hnn-001-01:~# exit
