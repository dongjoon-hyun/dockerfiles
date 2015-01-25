Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* Ubuntu 14.10
* Hadoop 2.5.2
* Spark 1.2.0
* Elasticsearch 1.4.2
* Tajo 0.9.0
* IPython 2.3.0

Run
---
You can build and run a cluster easily.

> $ sudo docker pull sktelecom/ubuntu14.10-hdw

> $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/ubuntu14.10-hdw/run-cluster.sh)"

> ...

> $ cd

> $ root@hnn-001-01:~# ./init-spark.sh 

> $ root@hnn-001-01:~# ./test-spark.sh 

> $ root@hnn-001-01:~# ./init-tajo.sh 

> $ root@hnn-001-01:~# /usr/local/tajo/bin/start-tajo.sh 

> $ root@hnn-001-01:~# ./test-tajo.sh 

> $ root@hnn-001-01:~# ./run-ipython-notebook.sh

> ...

> $ root@hnn-001-01:~# exit
