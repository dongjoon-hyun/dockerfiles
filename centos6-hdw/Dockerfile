FROM centos:centos6
MAINTAINER Dongjoon Hyun <dongjoon@apache.org>

RUN yum update -y && yum install -y which tar unzip openssh-server openssh-clients

RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

COPY config /root/.ssh/config
RUN chmod 400 /root/.ssh/config
COPY start.sh /root/start.sh
COPY sync-hosts.sh /root/sync-hosts.sh

# java
RUN \
  curl -LO 'http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie' && \
  rpm -i jdk-7u55-linux-x64.rpm && \
  rm jdk-7u55-linux-x64.rpm

ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin
RUN echo 'JAVA_HOME="/usr/java/default"' >> /etc/environment

# elasticsearch
RUN \
  cd /usr/local && curl -LO https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.1.zip && \
  unzip elasticsearch-1.4.1.zip && \
  ln -s ./elasticsearch-1.4.1 elasticsearch && \
  rm elasticsearch-1.4.1.zip
COPY elasticsearch.yml /usr/local/elasticsearch/config/
RUN chown -R root:root /usr/local/elasticsearch

# hadoop
RUN \
  cd /usr/local && curl -LO http://www.apache.org/dist/hadoop/common/hadoop-2.5.2/hadoop-2.5.2.tar.gz && \
  tar -xzf hadoop-2.5.2.tar.gz && \
  ln -s ./hadoop-2.5.2 hadoop && \
  rm hadoop-2.5.2.tar.gz

ENV HADOOP_PREFIX /usr/local/hadoop
ENV YARN_CONF_DIR /usr/local/hadoop/etc/hadoop
RUN \
  echo 'HADOOP_PREFIX="/usr/local/hadoop"' >> /etc/environment && \
  echo 'HADOOP_COMMON_HOME="/usr/local/hadoop"' >> /etc/environment && \
  echo 'HADOOP_HDFS_HOME="/usr/local/hadoop"' >> /etc/environment && \
  echo 'HADOOP_MAPRED_HOME="/usr/local/hadoop"' >> /etc/environment && \
  echo 'HADOOP_YARN_HOME="/usr/local/hadoop"' >> /etc/environment && \
  echo 'HADOOP_CONF_DIR="/usr/local/hadoop/etc/hadoop"' >> /etc/environment && \
  echo 'YARN_CONF_DIR="/usr/local/hadoop/etc/hadoop"' >> /etc/environment

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/java/default\nexport HADOOP_PREFIX=/usr/local/hadoop\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

COPY core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
COPY hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
COPY mapred-site.xml $HADOOP_PREFIX/etc/hadoop/mapred-site.xml
COPY yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh
COPY init-nn.sh /root/init-nn.sh

# spark
RUN \
  cd /usr/local && curl -LO http://d3kbcqa49mib13.cloudfront.net/spark-1.1.1-bin-hadoop2.4.tgz && \
  tar -xzf spark-1.1.1-bin-hadoop2.4.tgz && \
  ln -s spark-1.1.1-bin-hadoop2.4 spark && \
  rm spark-1.1.1-bin-hadoop2.4.tgz
COPY init-spark.sh /root/init-spark.sh
COPY test-spark.sh /root/test-spark.sh

ENV SPARK_HOME /usr/local/spark
RUN \
  echo 'SPARK_JAR="hdfs:///spark/spark-assembly-1.1.1-hadoop2.4.0.jar"' >> /etc/environment && \
  echo 'SPARK_HOME="/usr/local/spark"' >> /etc/environment
ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_PREFIX/bin

# tajo
RUN \
  cd /usr/local && curl -LO http://apache.mirror.cdnetworks.com/tajo/tajo-0.9.0/tajo-0.9.0.tar.gz && \
  tar -xzf tajo-0.9.0.tar.gz && \
  ln -s tajo-0.9.0 tajo && \
  rm tajo-0.9.0.tar.gz

ENV TAJO_HOME /usr/local/tajo
ENV HADOOP_HOME $HADOOP_PREFIX
RUN \
  echo 'TAJO_HOME="/usr/local/tajo"' >> /etc/environment && \
  echo 'HADOOP_HOME="/usr/local/hadoop"' >> /etc/environment

COPY tajo-site.xml $TAJO_HOME/conf/tajo-site.xml
COPY init-tajo.sh /root/init-tajo.sh
COPY data.csv /root/data.csv
COPY test-tajo.sh /root/test-tajo.sh

EXPOSE 22 7077 8020 8030 8031 8032 8033 8040 8042 8080 8088 9200 9300 26080 26081 50010 50020 50060 50070 50075 50090
