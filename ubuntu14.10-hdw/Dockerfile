FROM ubuntu:14.10
MAINTAINER Dongjoon Hyun <dongjoon@apache.org>

RUN apt-get update
RUN apt-get install -y git unzip openssh-server python-software-properties software-properties-common protobuf-compiler ipython ipython-notebook python-matplotlib

RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

COPY config /root/.ssh/
COPY start.sh /root/
COPY sync-hosts.sh /root/

# java
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV PATH $PATH:$JAVA_HOME/bin
RUN echo 'JAVA_HOME="/usr/lib/jvm/java-7-oracle"' >> /etc/environment

# elasticsearch
RUN \
  cd /usr/local && wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.5.2.zip && \
  unzip elasticsearch-1.5.2.zip && \
  ln -s ./elasticsearch-1.5.2 elasticsearch && \
  rm elasticsearch-1.5.2.zip
COPY elasticsearch.yml /usr/local/elasticsearch/config/
RUN chown -R root:root /usr/local/elasticsearch

# hadoop
RUN \
  cd /usr/local && wget -q http://www.apache.org/dist/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz && \
  tar -xzf hadoop-2.6.0.tar.gz && \
  ln -s ./hadoop-2.6.0 hadoop && \
  rm hadoop-2.6.0.tar.gz

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

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=$JAVA_HOME\nexport HADOOP_PREFIX=/usr/local/hadoop\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

COPY core-site.xml $HADOOP_PREFIX/etc/hadoop/
COPY hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/
COPY mapred-site.xml $HADOOP_PREFIX/etc/hadoop/
COPY yarn-site.xml $HADOOP_PREFIX/etc/hadoop/

RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh
COPY init-nn.sh /root/

# spark
RUN \
  cd /usr/local && wget -q http://www.us.apache.org/dist/spark/spark-1.3.1/spark-1.3.1-bin-hadoop2.4.tgz && \
  tar -xzf spark-1.3.1-bin-hadoop2.4.tgz && \
  ln -s spark-1.3.1-bin-hadoop2.4 spark && \
  rm spark-1.3.1-bin-hadoop2.4.tgz
COPY init-spark.sh /root/
COPY test-spark.sh /root/

ENV SPARK_HOME /usr/local/spark
RUN \
  echo 'SPARK_JAR="hdfs:///spark/spark-assembly-1.3.1-hadoop2.4.0.jar"' >> /etc/environment && \
  echo 'SPARK_HOME="/usr/local/spark"' >> /etc/environment
ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_PREFIX/bin

# ipython notebook
RUN \
  ipython profile create pyspark && \
  sed "s@# c.NotebookApp.ip = 'localhost'@c.NotebookApp.ip = '*'@g" -i /root/.ipython/profile_pyspark/ipython_notebook_config.py
COPY run-ipython-notebook.sh /root/
COPY sample.ipynb /root/

# hive
RUN \
  cd /usr/local && wget -q http://www.us.apache.org/dist/hive/hive-1.1.0/apache-hive-1.1.0-bin.tar.gz && \
  tar -xzf apache-hive-1.1.0-bin.tar.gz && \
  ln -s apache-hive-1.1.0-bin hive && \
  rm apache-hive-1.1.0-bin.tar.gz

ENV HIVE_HOME /usr/local/hive
ENV HADOOP_USER_CLASSPATH_FIRST true
RUN \
  echo 'HIVE_HOME="/usr/local/hive"' >> /etc/environment && \
  echo 'HADOOP_USER_CLASSPATH_FIRST="true"' >> /etc/environment
COPY data.csv /root/
COPY test-hive.sh /root/

EXPOSE 22 7077 8020 8030 8031 8032 8033 8040 8042 8080 8088 8888 9200 9300 10000 50010 50020 50060 50070 50075 50090
