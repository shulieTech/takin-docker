FROM alpine-jdk8:1.0 

MAINTAINER ZhangYa zhangya@shulie.io

WORKDIR /app

ADD surge-deploy-1.0-jar-with-dependencies.jar .

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]

#CMD tail -f > /dev/null

