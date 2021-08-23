#!/bin/bash
set -e
PATH=$PATH:/usr/lib/jvm/default-jvm/bin/
export PATH

cd /app

jar -xvf surge-deploy-1.0-jar-with-dependencies.jar deploy.properties

sed -i -e "s/127.0.0.1:2181/$ZK_HOSTS/g" deploy.properties

sed -i -e "s/127.0.0.1:8086/$INFLUXDB_HOST/g" deploy.properties

sed -i -e "s/config.influxdb.username\=root/config.influxdb.username\=$INFLUXDB_USERNAME/g" deploy.properties

sed -i -e "s/config.influxdb.password=shulie@2020/config.influxdb.password=$INFLUXDB_PASSOWORD/g" deploy.properties

sed -i -e "s/tro.url.ip=127.0.0.1/tro.url.ip=$TRO_WEB_HOST/g" deploy.properties

sed -i -e "s/127.0.0.1:8123/$CLICKHOUSE_HOST/g" deploy.properties

sed -i -e "s/config.clickhouse.password=rU4zGjA\//config.clickhouse.password=$CLICKHOUSE_PASSOWORD/g" deploy.properties

sed -i -e "s/config.clickhouse.userName=/config.clickhouse.userName=$CLICKHOUSE_USERNAME/g" deploy.properties

sed -i -e "s/127.0.0.1:3306/$MYSQL_HOST:$MYSQL_PORT/g" deploy.properties

sed -i -e "s/config.mysql.userName=root/config.mysql.userName=$MYSQL_USERNAME/g" deploy.properties

sed -i -e "s/config.mysql.password=shulie@2020/config.mysql.password=$MYSQL_PASSOWORD/g" deploy.properties


cat deploy.properties

jar -uvf surge-deploy-1.0-jar-with-dependencies.jar deploy.properties


java -cp surge-deploy-1.0-jar-with-dependencies.jar io.shulie.surge.data.deploy.pradar.config.PradarSupplierConfiguration $HOST_MAP
