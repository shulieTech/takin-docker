FROM alpine-jdk8:1.0

MAINTAINER ZhangYa zhangya@shulie.io

WORKDIR /app
ENV LANG=C.UTF-8
ADD surge-deploy-pradar-storm-1.0-SNAPSHOT.jar /

COPY entrypoint.sh /

ENTRYPOINT ["sh","/entrypoint.sh"]