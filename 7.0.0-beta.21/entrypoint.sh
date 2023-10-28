#!/usr/bin/env bash

cd /nodefony-starter

if [ "${NODEFONY_ENVIRONMENT}" == "dev" ]
then
  # DEVEOLPPEMENT
  echo "RUN NODEFONY CONTAINER MODE : ${NODEFONY_ENVIRONMENT}"
  if [ "${NODEFONY_DEBUG}" == "true" ]
  then
    npx nodefony -d dev
  else
    npx nodefony dev
  fi
else
  # PRODUCTION
  echo "RUN NODEFONY CONTAINER MODE : ${NODEFONY_ENVIRONMENT}"
  npx nodefony start --no-dump --no-daemon
fi
