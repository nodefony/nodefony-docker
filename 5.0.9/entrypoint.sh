#!/usr/bin/env bash

cd /nodefony

if [ "${NODEFONY_ENVIRONMENT}" == "dev" ]
then
  # DEVEOLPPEMENT
  echo "RUN NODEFONY CONTAINER MODE : ${NODEFONY_ENVIRONMENT}"
  if [ "${NODEFONY_DEBUG}" == "true" ]
  then
    ./node_modules/.bin/nodefony dev
  else
    ./node_modules/.bin/nodefony -d dev
  fi
else
  # PRODUCTION
  echo "RUN NODEFONY CONTAINER MODE : ${NODEFONY_ENVIRONMENT}"
  npm run prod
	sleep 2
	./node_modules/.bin/nodefony log
fi
