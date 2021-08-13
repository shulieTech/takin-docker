#!/bin/bash
set -e

password=$CLICKHOUSE_PASSWORD
sedstr="s/<password><\/password>/<password>$password<\/password>/g"
sed -i -e $sedstr /etc/clickhouse-server/users.xml
