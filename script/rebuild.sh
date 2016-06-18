#!/bin/bash
APP_DIR=$PWD
BACKUP_DIR=$PWD/backup
mkdir -p $BACKUP_DIR
YML_URL=$APP_DIR/containers/compose-development.yml

if [ -z "`docker ps -a | grep datastore | awk '{ print $12 }'`" ]; then
  echo 'make datastore'
  docker build -t datastore containers/datastore
  docker run -d --name datastore datastore
  docker cp db datastore:/usr/src/app
  docker cp public datastore:/usr/src/app
else
  ./script/docker-backup.sh datastore backup/gochiso
fi

# Docker Stop
IMG=`docker ps -q`
if [ -n "$IMG" ]; then
  docker stop $IMG
  docker rm $IMG
fi

# Build & Up
docker-compose -f $YML_URL build
docker-compose -f $YML_URL up -d
