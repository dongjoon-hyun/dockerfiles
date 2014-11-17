Hadoop Data Warehouse
====================

Components
----------
This is a reference model for Hadoop Data Warehouse.

* Ubuntu 14.10
* Hadoop 2.5.1
* Spark 1.1.0
* Elasticsearch 1.4.0
* Tajo (not yet)

Run
---
You can build and run a cluster easily.

> \$ docker pull sktelecom/ubuntu14.10-hdw
> \$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/dongjoon-hyun/dockerfiles/master/ubuntu14.10-hdw/run-cluster.sh)"
> ...
> \$ cd
> \$ root@hnn-001-01:~# ./init-spark.sh 
> \$ root@hnn-001-01:~# ./run-test.sh 
> ...
> \$ root@hnn-001-01:~# exit
