FROM yandex/clickhouse-server:latest

MAINTAINER GuoLong zhangya@shulie.io

WORKDIR /docker-entrypoint-initdb.d
ENV LANG=C.UTF-8
ADD clickhouse.sql init.sh .
RUN cd ~

EXPOSE 9000
