#!/bin/bash
FROM jackluo/hadoop:2.7.2
ADD hbase-1.2.1-bin.tar.gz /opt/modules/
ENV HBASE_HOME /opt/modules/hbase-1.2.1
WORKDIR /opt/modules/hbase-1.2.1
COPY conf/* ./conf/
ENV PATH $PATH:$HBASE_HOME/bin
