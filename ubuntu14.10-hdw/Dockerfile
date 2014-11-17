FROM ubuntu:14.10
MAINTAINER Dongjoon Hyun <dongjoon@apache.org>

RUN apt-get update
RUN apt-get install -y unzip openssh-server python-software-properties software-properties-common

RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ADD config /root/.ssh/config
ADD start.sh /root/start.sh
ADD sync-hosts.sh /root/sync-hosts.sh

EXPOSE 22

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
RUN wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.0.zip
RUN unzip elasticsearch-1.4.0.zip -d /opt
RUN mv /opt/elasticsearch-1.4.0 /opt/elasticsearch && rm elasticsearch-1.4.0.zip
ADD elasticsearch.yml /opt/elasticsearch/config/
RUN chown -R root:root /opt/elasticsearch

EXPOSE 9200 9300

# hadoop
RUN \
  cd /usr/local && wget -q http://www.apache.org/dist/hadoop/common/hadoop-2.5.1/hadoop-2.5.1.tar.gz && \
  tar -xzf hadoop-2.5.1.tar.gz && \
  ln -s ./hadoop-2.5.1 hadoop && \
  rm hadoop-2.5.1.tar.gz

ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=$JAVA_HOME\nexport HADOOP_PREFIX=/usr/local/hadoop\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

ADD core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
ADD hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
ADD mapred-site.xml $HADOOP_PREFIX/etc/hadoop/mapred-site.xml
ADD yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh
ADD init-nn.sh /root/init-nn.sh

EXPOSE 50020 50090 50070 50010 50075 8031 8032 8033 8040 8042 49707 8088 8030

# spark
RUN \
  cd /usr/local && wget -q http://d3kbcqa49mib13.cloudfront.net/spark-1.1.0-bin-hadoop2.4.tgz && \
  tar -xzf spark-1.1.0-bin-hadoop2.4.tgz && \
  ln -s spark-1.1.0-bin-hadoop2.4 spark && \
  rm spark-1.1.0-bin-hadoop2.4.tgz
ADD init-spark.sh /root/init-spark.sh
ADD run-test.sh /root/run-test.sh

ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV SPARK_JAR hdfs:///spark/spark-assembly-1.1.0-hadoop2.4.0.jar
ENV SPARK_HOME /usr/local/spark
ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_PREFIX/bin

# TODO: tajo

