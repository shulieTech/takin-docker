#!/bin/bash
set -e

params=""

if [ ! -z "$MYSQL_HOST" ]; then
	params="$params --resource.mysql.host=$MYSQL_HOST"
fi

if [ ! -z "$MYSQL_PORT" ]; then
	params="$params --resource.mysql.port=$MYSQL_PORT"
fi

if [ ! -z "$MYSQL_USERNAME" ]; then
	params="$params --resource.mysql.username=$MYSQL_USERNAME"
fi

if [ ! -z "$MYSQL_PASSOWORD" ]; then
	params="$params --resource.mysql.password=$MYSQL_PASSOWORD"
fi

if [ ! -z "$REDIS_HOST" ]; then
	params="$params --resource.redis.host=$REDIS_HOST"
fi

if [ ! -z "$REDIS_PORT" ]; then
	params="$params --resource.redis.port=$REDIS_PORT"
fi

if [ ! -z "$REDIS_PASSWORD" ]; then
	params="$params --resource.redis.password=$REDIS_PASSWORD"
fi

if [ ! -z "$TRO_CLOUD_HOST" ]; then
	params="$params --trocloud.out.url=$TRO_CLOUD_HOST"
fi

if [ ! -z "$AMDB_HOST" ]; then
	params="$params --amdb.url.amdb=$AMDB_HOST"
fi

if [ ! -z "$ZK_HOSTS" ]; then
	params="$params --tro.config.zk.addr=$ZK_HOSTS"
fi

if [ ! -z "$EXT_CONFIG" ]; then
	params="$params $EXT_CONFIG"
fi

java  -jar /app/tro-web-app-1.0.0-SNAPSHOT.jar $params