FROM bde2020/spark-submit:2.4.0-hadoop2.7

MAINTAINER Dharani Sudharsan <dharani.sudharsans@outlook.in>

ENV SPARK_APPLICATION_JAR_NAME com.newyorker.challenge-1.0-SNAPSHOT
ENV SPARK_APPLICATION_MAIN_CLASS service.jsonRead

COPY yelp_processor.sh /
COPY submit.sh /

RUN apk add --no-cache openjdk8 maven\
      && chmod +x /yelp_processor.sh \
      && mkdir -p /app \
      && mkdir -p /usr/src/app/target

RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-2.7.3.tar.gz && \
    tar -xvf hadoop-2.7.3.tar.gz

# COPY com.newyorker.challenge-1.0-SNAPSHOT.jar /usr/src/app/target

ENV HADOOP_HOME=/hadoop-2.7.3
ENV HADOOP_CONF_DIR=/hadoop-2.7.3/etc/hadoop
ENV HADOOP_MAPRED_HOME=/hadoop-2.7.3
ENV HADOOP_HDFS_HOME=/hadoop-2.7.3
ENV HADOOP_COMMON_HOME=/hadoop-2.7.3
ENV YARN_HOME=/hadoop-2.7.3
ENV PATH=${PATH}:/hadoop-2.7.3/bin
# ENV JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

CMD ["/bin/bash", "/yelp_processor.sh", "yelp_dataset.tar"]
