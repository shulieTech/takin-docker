#!/bin/bash
set -e

if [ -z "$TAKIN_TRO_WEB_URL" ]; then
     TAKIN_TRO_WEB_URL=127.0.0.1 
fi

sed -i -e "s/var serverUrl \= 'http:\/\/127.0.0.1:10008\/tro-web\/api'/var serverUrl = 'http:\/\/$TAKIN_TRO_WEB_URL:10008\/tro-web\/api'/g " /app/dist/tro/index.html

nginx
