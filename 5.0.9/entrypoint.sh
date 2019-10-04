#!/usr/bin/env bash

cd /nodefony

if [ "${NODEFONY_DOCKER_ENVIRONMENT}" == "compose" ]
then
  echo "RUN NODEFONY CONTAINER MODE :${NODEFONY_ENVIRONMENT}"
  #cp /docker/config/config.yml ./config/config.yml

  #cp /docker/app/config/config.yml ./app/config/config.yml

  #cp /docker/bundles/demoBundle/config.yml ./src/bundles/demoBundle/Resources/config/config.yml

fi

if [ "${NODEFONY_ENVIRONMENT}" == "dev" ]
then
  # DEVEOLPPEMENT
  echo "RUN NODEFONY CONTAINER MODE :${NODEFONY_ENVIRONMENT}"
  ./node_modules/.bin/nodefony dev
else
  # PRODUCTION
  echo "RUN NODEFONY CONTAINER MODE :${NODEFONY_ENVIRONMENT}"
  npm run prod
	#./node_modules/.bin/nodefony dev
fi

tail -f /dev/null
