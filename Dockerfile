FROM jackluo/hadoop-base:1.1

RUN mkdir -p /opt/modules

ADD hbase-1.1.5.tar.gz /opt/modules/
ENV HBASE_HOME /opt/modules/hbase-1.1.5
WORKDIR /opt/modules/hbase-1.1.5
COPY conf/* ./conf/
ENV PATH $PATH:$HBASE_HOME/bin

EXPOSE 16010
