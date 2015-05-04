Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* CentOS 6.6
* Hadoop 2.6.0
* Spark 1.3.1
* Elasticsearch 1.5.2
* Hive 1.1.0
* IPython 2.3.0

Run
---
You can build and run a cluster easily.

> $ sudo docker pull sktelecom/centos6-hdw

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/centos6-hdw/run-cluster.sh)"

> ...

> $ root@hnn-001-01:~# ./init-spark.sh 

> $ root@hnn-001-01:~# ./test-spark.sh 

> $ root@hnn-001-01:~# ./test-hive.sh 

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
