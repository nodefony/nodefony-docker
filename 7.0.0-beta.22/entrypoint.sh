#!/usr/bin/env bash

cd /home/node/nodefony-starter
su -ls node

if [ "${NODEFONY_ENV_APP}" == "dev" ]
then
  # DEVEOLPPEMENT
  echo "RUN NODEFONY CONTAINER MODE : ${NODEFONY_ENV_APP}"
  if [ "${NODEFONY_DEBUG}" == "true" ]
  then
    npx nodefony -d dev
  else
    npx nodefony dev
  fi
else
  # PRODUCTION
  echo "RUN NODEFONY CONTAINER MODE : ${NODEFONY_ENV_APP}"
  sleep 10
  
  npm run pm2 install pm2-logrotate
  npm run pm2 set pm2-logrotate:max_size 100M # (1KB)
  npm run pm2 set pm2-logrotate:compress true 
  npm run pm2 startup -u node --hp /nodefony-starter  --service-name nodefony-starter
  npx nodefony start --no-dump --no-daemon 
fi