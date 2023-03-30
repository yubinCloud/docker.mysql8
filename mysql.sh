#!/bin/bash
docker pull mysql:8.0.32

mkdir /srv/mysql8

cp -r volume/ /srv/mysql8/

docker run --restart=always -d --name mysql8 -p 3306:3306 \
      --network=antv-data-server \
      --network-alias=mysql.server \
      -v /srv/mysql8/volume/conf/my.cnf:/etc/mysql/my.cnf \
      -v /srv/mysql8/volume/data:/var/lib/mysql \
      -e MYSQL_ROOT_PASSWORD=root \
      mysql:8.0.32
