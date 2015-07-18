Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* Ubuntu 14.10
* Hadoop 2.7.1
* Spark 1.4.1
* Elasticsearch 1.7.0
* Hive 1.2.1
* Python 2.7.8
* IPython 3.2.1

Run
---
You can build and run a cluster easily.

> $ sudo docker pull sktelecom/ubuntu14.10-hdw

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/ubuntu14.10-hdw/run-cluster.sh)"

> ...

> $ root@hnn-001-01:~# ./init-spark.sh 

> $ root@hnn-001-01:~# ./test-spark.sh 

> $ root@hnn-001-01:~# ./test-hive.sh 

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
