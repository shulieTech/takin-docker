#!/bin/bash
set -e
params=""

if [[ ! -z "$MYSQL_HOST" && ! -z "$MYSQL_PORT" ]]; then
	params="$params --spring.datasource.url=jdbc:mysql://$MYSQL_HOST:$MYSQL_PORT/amdb?useUnicode=true&characterEncoding=UTF-8&useSSL=false&allowMultiQueries=true&serverTimezone=GMT%2B8"
fi


if [ ! -z "$MYSQL_USERNAME" ]; then
	params="$params --spring.datasource.username=$MYSQL_USERNAME"
fi

if [ ! -z "$MYSQL_PASSOWORD" ]; then
	params="$params --spring.datasource.password=$MYSQL_PASSOWORD"
fi

if [[ ! -z "$INFLUXDB_HOST" && ! -z "$INFLUXDB_PORT" ]]; then
	params="$params --influx.openurl=http://$INFLUXDB_HOST:$INFLUXDB_PORT"
fi

if [ ! -z "$INFLUXDB_USERNAME" ]; then
	params="$params --influx.username=$INFLUXDB_USERNAME"
fi

if [ ! -z "$INFLUXDB_PASSOWORD" ]; then
	params="$params --zookeeper.server=$INFLUXDB_PASSOWORD"
fi

if [ ! -z "$ZK_HOSTS" ]; then
	params="$params --zookeeper.server=$ZK_HOSTS"
fi

if [[ ! -z "$CLICKHOUSE_HOST" && ! -z "$CLICKHOUSE_PORT" ]]; then
	params="$params --config.clickhouse.url=jdbc:clickhouse://$CLICKHOUSE_HOST:$CLICKHOUSE_PORT/default"
fi

if [ ! -z "$CLICKHOUSE_USERNAME" ]; then
	params="$params --config.clickhouse.username=$CLICKHOUSE_USERNAME"
fi

if [ ! -z "$CLICKHOUSE_PASSOWORD" ]; then
	params="$params --config.clickhouse.password=$CLICKHOUSE_PASSOWORD"
fi

java  -jar /app/amdb-app-1.0.4.1-SNAPSHOT.jar $params