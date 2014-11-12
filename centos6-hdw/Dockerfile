FROM centos:centos6
MAINTAINER Dongjoon Hyun <dongjoon@apache.org>

RUN yum update -y && yum install -y which unzip openssh-server openssh-clients

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ADD config /root/.ssh/config
ADD start.sh /root/start.sh
ADD sync-hosts.sh /root/sync-hosts.sh

EXPOSE 22

# java
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie'
RUN rpm -i jdk-7u55-linux-x64.rpm
RUN rm jdk-7u55-linux-x64.rpm

ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin

# elasticsearch
RUN curl -LO https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.0.zip
RUN unzip elasticsearch-1.4.0.zip -d /opt
RUN mv /opt/elasticsearch-1.4.0 /opt/elasticsearch
RUN rm elasticsearch-1.4.0.zip
ADD elasticsearch.yml /opt/elasticsearch/config/
RUN chown -R root:root /opt/elasticsearch

EXPOSE 9200 9300

# hadoop
RUN yum install -y tar
RUN curl -s http://www.apache.org/dist/hadoop/common/hadoop-2.5.1/hadoop-2.5.1.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./hadoop-2.5.1 hadoop

ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/java/default\nexport HADOOP_PREFIX=/usr/local/hadoop\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

ADD core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
ADD hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
ADD mapred-site.xml $HADOOP_PREFIX/etc/hadoop/mapred-site.xml
ADD yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh
ADD init-nn.sh /root/init-nn.sh

EXPOSE 50020 50090 50070 50010 50075 8031 8032 8033 8040 8042 49707 22 8088 8030

# spark
RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.1.0-bin-hadoop2.4.tgz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s spark-1.1.0-bin-hadoop2.4 spark
ADD init-spark.sh /root/init-spark.sh
ADD run-test.sh /root/run-test.sh

ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV SPARK_JAR hdfs:///spark/spark-assembly-1.1.0-hadoop2.4.0.jar
ENV SPARK_HOME /usr/local/spark
ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_PREFIX/bin

# TODO: tajo
