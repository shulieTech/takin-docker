FROM alpine-jdk8:1.0

MAINTAINER GuoLong zhangya@shulie.io

WORKDIR /app
ENV LANG=C.UTF-8
ADD tro-web-app-1.0.0-SNAPSHOT.jar .

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]

VOLUME ["/app/script"]

EXPOSE 10008
