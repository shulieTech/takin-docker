FROM alpine-jdk8:1.0

MAINTAINER GuoLong zhangya@shulie.io

WORKDIR /app

VOLUME ["/app/script"]
RUN mkdir -p /app/script/tmp
ENV LANG=C.UTF-8
ADD tro-cloud-app-1.0.0-SNAPSHOT.jar .
RUN mkdir /app/engine
COPY pressure-engine.tar.gz /app/engine/pressure-engine.tar.gz

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]

VOLUME ["/app/script"]

EXPOSE 10010
