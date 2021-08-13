FROM mysql:5.7
MAINTAINER GuoLong zhangya@shulie.io
WORKDIR /docker-entrypoint-initdb.d
ENV LANG=C.UTF-8
ADD amdb.sql trodb_cloud_base.sql trodb_web_base.sql .
