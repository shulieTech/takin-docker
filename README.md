### mysql

###### 镜像打包

```
docker build --force-rm --no-cache -t takin-mysql:1.0 .
```

###### 镜像启动
```
docker run --name takin-mysql -e MYSQL_ROOT_PASSWORD=shulie@2020 -d takin-mysql:1.0
```

 -p 3306:3306
 
参数 MYSQL_ROOT_PASSWORD ：指定密码

###### docker 镜像导出
```
docker save -o takin-mysql.tar takin-mysql:1.0
```

### clickhouse
###### 镜像打包

```
docker build --force-rm --no-cache -t takin-clickhouse:1.0 . 
```

###### 镜像启动

```
docker run -d --name takin-clickhouse \
-e CLICKHOUSE_PASSWORD=shulie@2020 --ulimit nofile=262144:262144 takin-clickhouse:1.0
```

-p 9000:9000 \
-p 8123:8123 \

参数 CLICKHOUSE_PASSWORD ：指定密码


###### docker 镜像导出
```
docker save -o takin-clickhouse.tar takin-clickhouse:1.0
```

### redis


###### 镜像启动

```
docker run -d --name takin-redis redis --requirepass "shulie@2020"
```
 -p 6379:6379
 
参数 requirepass ：指定密码


### influxdb


###### 镜像启动

```
docker run -d --name takin-influxdb -e INFLUXDB_HTTP_AUTH_ENABLED=true -e INFLUXDB_ADMIN_USER=root -e INFLUXDB_ADMIN_PASSWORD=shulie@2020 -e INFLUXDB_DB=jmeter influxdb:1.8.9
```
 -p 8086:8086
 
参数 

是否允许http鉴权 INFLUXDB_HTTP_AUTH_ENABLED ：true

管理员用户名 INFLUXDB_ADMIN_USER ：root

管理员用户名 INFLUXDB_ADMIN_PASSWORD ：shulie@2020


### takin-nginx

###### 镜像打包

```
docker build --force-rm --no-cache -t takin-nginx:1.0 .
```



###### 镜像启动
```
docker run -d --name takin-nginx  -p 80:80 takin-nginx:1.0

```
参数  ：指定密码

###### docker 镜像导出
```
docker save -o takin-nginx.tar takin-nginx:1.0
```


### takin-zookeeper


###### 镜像启动
```
docker run -d --name takin-zookeeper zookeeper

```

  -p 2181:2181
  
参数  ：指定密码

###### docker 镜像导出
```
docker save -o takin-nginx.tar takin-nginx:1.0
```


### tro-web

###### 镜像打包

```
docker build --force-rm --no-cache -t takin-tro-web:1.0 .
```

###### 镜像启动
```
docker run -d --name takin-tro-web \
-p 10008:10008 \
-e MYSQL_HOST=takin-mysql \
-e MYSQL_PORT=3306 \
-e MYSQL_USERNAME=root \
-e MYSQL_PASSOWORD=shulie@2020 \
-e REDIS_HOST=takin-redis \
-e REDIS_PORT=6379 \
-e REDIS_PASSOWORD=shulie@2020 \
-e TRO_CLOUD_HOST=takin-tro-cloud:10010 \
-e AMDB_HOST=http://takin-amdb:10032 \
-e ZK_HOSTS=takin-zookeeper:2181 \
-e EXT_CONFIG=1234=12123 \
--link takin-mysql:takin-mysql \
--link takin-redis:takin-redis \
--link takin-influxdb:takin-influxdb \
--link takin-zookeeper:takin-zookeeper \
--link takin-tro-cloud:takin-tro-cloud \
--link takin-amdb:takin-amdb \
--volumes-from takin-tro-cloud \
takin-tro-web:1.0
```


参数  
MYSQL_HOST=takin-mysql

MYSQL_PORT=3306

MYSQL_USERNAME=root

MYSQL_PASSOWORD=shulie@2020


REDIS_HOST=takin-redis

REDIS_PORT=6379

REDIS_PASSOWORD=shulie@2020


TRO_CLOUD_HOST=takin-tro-cloud:10010

AMDB_HOST=http://takin-amdb:10032

ZK_HOSTS=takin-zookeeper:2181

EXT_CONFIG=1234=12123


###### docker 镜像导出
```
docker save -o takin-tro-web.tar takin-tro-web:1.0
```

### tro-cloud

###### 镜像打包

```
docker build --force-rm --no-cache -t takin-tro-cloud:1.0 .
```

###### 镜像启动
```
docker run -d --name takin-tro-cloud -p 10010:10010 \
-e MYSQL_HOST=takin-mysql \
-e MYSQL_PORT=3306 \
-e MYSQL_USERNAME=root \
-e MYSQL_PASSOWORD=shulie@2020 \
-e REDIS_HOST=takin-redis \
-e REDIS_PORT=6379 \
-e REDIS_PASSOWORD=shulie@2020 \
-e INFLUXDB_HOST=takin-influxdb \
-e INFLUXDB_PORT=8086 \
-e INFLUXDB_USERNAME=root \
-e INFLUXDB_PASSOWORD=shulie@2020 \
-e TRO_CLOUD_HOST=takin-tro-cloud:10010 \
-e EXT_CONFIG=1234=12123 \
--link takin-mysql:takin-mysql \
--link takin-redis:takin-redis \
--link takin-influxdb:takin-influxdb \
takin-tro-cloud:1.0
```

-v /app/script \


--link takin-tro-amdb:takin-tro-amdb \

参数  
MYSQL_HOST=takin-mysql

MYSQL_PORT=3306

MYSQL_USERNAME=root

MYSQL_PASSOWORD=shulie@2020


REDIS_HOST=takin-redis

REDIS_PORT=6379

REDIS_PASSOWORD=shulie@2020


INFLUXDB_HOST=takin-influxdb

INFLUXDB_PORT=8086

INFLUXDB_PASSOWORD=shulie@2020


EXT_CONFIG=1234=12123

###### docker 镜像导出
```
docker save -o takin-tro-cloud.tar takin-tro-cloud:1.0


### surge-data

###### 镜像打包

```
docker build --force-rm --no-cache -t takin-surge-data:1.0 .
```

###### 镜像启动
```
docker run -d --name takin-surge -p 29900-29999:29900-29999 \
-e MYSQL_HOST=takin-mysql \
-e MYSQL_PORT=3306 \
-e MYSQL_USERNAME=root \
-e MYSQL_PASSOWORD=shulie@2020 \
-e INFLUXDB_HOST= \
-e INFLUXDB_PORT= \
-e INFLUXDB_USERNAME= \
-e INFLUXDB_PASSOWORD= \
-e TROWEB_HOST= \
-e CK_HOSTS= \
-e AMDB_HOST=http://takin-amdb:10032 \
takin-surge-data:1.0 .
```

--link takin-tro-amdb:takin-tro-amdb \

参数  
MYSQL_HOST=takin-mysql

MYSQL_PORT=3306

MYSQL_USERNAME=root

MYSQL_PASSOWORD=shulie@2020


REDIS_HOST=takin-redis

REDIS_PORT=6379

REDIS_PASSOWORD=shulie@2020


INFLUXDB_HOST=takin-influxdb

INFLUXDB_PORT=8086

INFLUXDB_PASSOWORD=shulie@2020


EXT_CONFIG=1234=12123

###### docker 镜像导出
```
docker save -o takin-tro-cloud.tar takin-tro-cloud:1.0



### amdb

###### 镜像打包

```
docker build --force-rm --no-cache -t takin-amdb:1.0 .
```

###### 镜像启动
```
docker run -d --name takin-amdb -p 10032:10032 \
-e MYSQL_HOST=takin-mysql \
-e MYSQL_PORT=3306 \
-e MYSQL_USERNAME=root \
-e MYSQL_PASSOWORD=shulie@2020 \
-e CLICKHOUSE_HOST=takin-clickhouse \
-e CLICKHOUSE_PORT=8123 \
-e CLICKHOUSE_USERNAME=default \
-e CLICKHOUSE_PASSWORD=shulie@2020 \
-e INFLUXDB_HOST=takin-influxdb \
-e INFLUXDB_PORT=8086 \
-e INFLUXDB_USERNAME=root \
-e INFLUXDB_PASSOWORD=shulie@2020 \
-e EXT_CONFIG="1234=12123" \
--link takin-mysql:takin-mysql \
--link takin-influxdb:takin-influxdb \
--link takin-clickhouse:takin-clickhouse \
takin-amdb:1.0

```

参数  
MYSQL_HOST=takin-mysql

MYSQL_PORT=3306

MYSQL_USERNAME=root

MYSQL_PASSOWORD=shulie@2020


REDIS_HOST=takin-redis

REDIS_PORT=6379

REDIS_PASSOWORD=shulie@2020


INFLUXDB_HOST=takin-influxdb

INFLUXDB_PORT=8086

INFLUXDB_USERNAME=8086

INFLUXDB_PASSOWORD=shulie@2020

EXT_CONFIG=1234=12123
参数  ：指定密码

###### docker 镜像导出
```
docker save -o takin-mysql.tar takin-mysql:1.0


### alpine

###### 镜像打包

docker build --force-rm --no-cache -t alpine-jdk8:1.0 .


docker save -o alpine-jdk8.tar  alpine-jdk8:1.0 
