FROM java:latest
MAINTAINER Dongjoon Hyun <dongjoon@apache.org>

RUN apt-get update && apt-get install -y git curl unzip openssh-server python-software-properties software-properties-common protobuf-compiler build-essential python-dev

RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

COPY config /root/.ssh/
COPY start.sh /root/
COPY sync-hosts.sh /root/

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV PATH $PATH:$JAVA_HOME/bin
RUN echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"' >> /etc/environment

# hadoop
RUN \
  cd /usr/local && curl -LO http://www-us.apache.org/dist/hadoop/common/hadoop-3.0.0-alpha1/hadoop-3.0.0-alpha1.tar.gz && \
  tar -xzf hadoop-3.0.0-alpha1.tar.gz && \
  ln -s ./hadoop-3.0.0-alpha1 hadoop && \
  rm hadoop-3.0.0-alpha1.tar.gz

ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
RUN \
  echo 'HADOOP_HOME="/usr/local/hadoop"' >> /etc/environment && \
  echo 'HADOOP_COMMON_HOME="/usr/local/hadoop"' >> /etc/environment && \
  echo 'HADOOP_HDFS_HOME="/usr/local/hadoop"' >> /etc/environment && \
  echo 'HADOOP_MAPRED_HOME="/usr/local/hadoop"' >> /etc/environment && \
  echo 'HADOOP_YARN_HOME="/usr/local/hadoop"' >> /etc/environment && \
  echo 'HADOOP_CONF_DIR="/usr/local/hadoop/etc/hadoop"' >> /etc/environment

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=$JAVA_HOME\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_HOME/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_HOME/etc/hadoop/hadoop-env.sh

COPY core-site.xml $HADOOP_PREFIX/etc/hadoop/
COPY hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/
COPY mapred-site.xml $HADOOP_PREFIX/etc/hadoop/
COPY yarn-site.xml $HADOOP_PREFIX/etc/hadoop/

RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh
COPY init-nn.sh /root/

# spark
RUN \
  cd /usr/local && curl -LO http://www.us.apache.org/dist/spark/spark-2.0.0/spark-2.0.0-bin-hadoop2.7.tgz && \
  tar -xzf spark-2.0.0-bin-hadoop2.7.tgz && \
  ln -s spark-2.0.0-bin-hadoop2.7 spark && \
  rm spark-2.0.0-bin-hadoop2.7.tgz

ENV SPARK_HOME /usr/local/spark
RUN echo 'SPARK_HOME="/usr/local/spark"' >> /etc/environment
ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_PREFIX/bin

# hive
RUN \
  cd /usr/local && curl -LO http://www.us.apache.org/dist/hive/hive-2.1.0/apache-hive-2.1.0-bin.tar.gz && \
  tar -xzf apache-hive-2.1.0-bin.tar.gz && \
  ln -s apache-hive-2.1.0-bin hive && \
  rm apache-hive-2.1.0-bin.tar.gz

ENV HIVE_HOME /usr/local/hive
ENV HADOOP_USER_CLASSPATH_FIRST true
RUN \
  echo 'HIVE_HOME="/usr/local/hive"' >> /etc/environment && \
  echo 'HADOOP_USER_CLASSPATH_FIRST="true"' >> /etc/environment
ENV PATH $PATH:$HIVE_HOME/bin
COPY data.csv /root/
COPY test-hive.sh /root/

EXPOSE 22 4040 7077 8020 8030 8031 8032 8033 8040 8042 8080 8088 8888 9870 10000 50010 50020 50060 50070 50075 50090
