FROM alpine-jdk8:1.0

MAINTAINER GuoLong zhangya@shulie.io

WORKDIR /app
ENV LANG=C.UTF-8
ADD amdb-app-1.0.4.1-SNAPSHOT.jar .

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]

EXPOSE 10032
