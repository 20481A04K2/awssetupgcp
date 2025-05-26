#!/bin/bash
APP_PATH="/home/deploy/nudgeengine"
TMP_PATH="/home/deploy/nudgeengine-tmp"

mkdir -p $APP_PATH-backup
cp -rf $APP_PATH/* $APP_PATH-backup/

cp -rf $TMP_PATH/* $APP_PATH/

gcloud secrets versions access latest --secret="PROD_COMMON_CONFIG" > $APP_PATH/appsettings.default.readonly.json
gcloud secrets versions access latest --secret="PROD_NUDGEENGINE_CONFIG" > $APP_PATH/appsettings.json

chown -R deploy:deploy $APP_PATH
chmod -R 744 $APP_PATH/*.dll

systemctl start nudgeengine
