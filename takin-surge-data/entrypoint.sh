#!/bin/bash
echo "installing"

set -e

rm -rf deploy.properties

jar xvf  surge-deploy-pradar-storm-1.0-SNAPSHOT.jar deploy.properties

sed -i "s/pradar.host.zk01:2181,pradar.host.zk02:2181,pradar.host.zk03:2181/$ZK_HOSTS/g" deploy.properties

sed -i "s/pradar.host.influxdb:8086/$INFLUXDB_HOSTS/g" deploy.properties

sed -i "s/config.influxdb.username=pradar/config.influxdb.username=$INFLUXDB_USERNAME/g" deploy.properties

sed -i "s/config.influxdb.password=pradar/config.influxdb.password=$INFLUXDB_PASSOWORD/g" deploy.properties

sed -i "s/pradar.host.troweb/$TRO_HOST/g" deploy.properties

sed -i "s/pradar.host.clickhouse01:8123,pradar.host.clickhouse02:8123/$CK_HOSTS/g" deploy.properties

sed -i "s/config.clickhouse.password=rU4zGjA\/config.clickhouse.password=/$CK_PASSWORD/g" deploy.properties

sed -i "s/pradar.host.mysql.amdb:3306/$MYSQL_HOSTS/g" deploy.properties

sed -i "s/config.mysql.userName=root/config.mysql.userName=$MYSQL_USERNAME/g" deploy.properties

sed -i "s/config.mysql.password=shulie@2020/config.mysql.password=$MYSQL_PASSOWORD/g" deploy.properties

sed -i "s/pradar.host.amdb:10032/$AMDB_HOST/g" deploy.properties

jar  -uvf surge-deploy-pradar-storm-1.0-SNAPSHOT.jar deploy.properties

nohup java -cp  surge-deploy-pradar-storm-1.0-SNAPSHOT.jar  io.shulie.surge.data.deploy.pradar.bootstrap.PradarTopologyBootStrap > pradar.log &

echo "finished"