FROM geekidea/alpine-a:3.10

MAINTAINER GuoLong zhangya@shulie.io

WORKDIR /app

ENV LANG=C.UTF-8

COPY dist /app/dist

COPY entrypoint.sh /entrypoint.sh

COPY nginx.conf /etc/nginx/nginx.conf

RUN apk add nginx

ENTRYPOINT ["sh","/entrypoint.sh"]

EXPOSE 80
