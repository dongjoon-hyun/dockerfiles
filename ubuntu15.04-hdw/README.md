Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* Ubuntu 14.10
* Hadoop 2.6.0
* Spark 1.3.1
* Elasticsearch 1.5.0
* Tajo 0.10.0
* Hive 1.1.0
* IPython 2.3.0

Run
---
You can build and run a cluster easily.

> $ sudo docker pull sktelecom/ubuntu15.04-hdw

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/ubuntu14.10-hdw/run-cluster.sh)"

> ...

> $ root@hnn-001-01:~# ./init-spark.sh 

> $ root@hnn-001-01:~# ./test-spark.sh 

> $ root@hnn-001-01:~# ./init-tajo.sh 

> $ root@hnn-001-01:~# /usr/local/tajo/bin/start-tajo.sh 

> $ root@hnn-001-01:~# ./test-tajo.sh 

> $ root@hnn-001-01:~# ./test-hive.sh 

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
