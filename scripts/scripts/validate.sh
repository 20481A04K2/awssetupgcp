#!/bin/bash
service_name="nudgeengine"
APP_PATH="/home/deploy/nudgeengine"
TMP_PATH="/home/deploy/nudgeengine-tmp"
BACKUP_PATH="$APP_PATH-backup"

sleep 10
if systemctl is-active --quiet $service_name; then
  echo "Deployment successful"
  rm -rf $BACKUP_PATH $TMP_PATH
else
  echo "Deployment failed, restoring backup..."
  cp -rf $BACKUP_PATH/* $APP_PATH/
  systemctl restart $service_name
  rm -rf $BACKUP_PATH $TMP_PATH
  exit 1
fi
