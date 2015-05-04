Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* CentOS 7
* Hadoop 2.5.2
* Spark 1.2.0
* Elasticsearch 1.4.2
* Hive 0.14
* IPython 2.3.0

Run
---
You can build and run a cluster easily.

> $ sudo docker pull sktelecom/centos7-hdw

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/centos7-hdw/run-cluster.sh)"

> ...

> $ cd

> $ root@hnn-001-01:~# ./init-spark.sh 

> $ root@hnn-001-01:~# ./test-spark.sh 

> $ root@hnn-001-01:~# ./test-hive.sh 

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
