FROM alpine-jdk8:1.0

MAINTAINER GuoLong zhangya@shulie.io

WORKDIR /app

ENV LANG=C.UTF-8

ADD tro-cloud-app-1.0.0-SNAPSHOT.jar .

RUN mkdir /app/engine

COPY pressure-engine.tar.gz /app/engine/pressure-engine.tar.gz

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]

VOLUME ["/app/script"]

#CMD ["tail","-f","/dev/null"]
EXPOSE 10010
