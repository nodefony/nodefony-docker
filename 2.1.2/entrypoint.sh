#!/usr/bin/env bash


cd /nodefony

if [ "${NODEFONY_DOCKER_ENVIRONMENT}" == "compose" ]
then
	cp /docker/config/config.yml ./config/config.yml

	cp /docker/app/config/config.yml ./app/config/config.yml

	cp /docker/bundles/demoBundle/config.yml ./src/bundles/demoBundle/Resources/config/config.yml

fi


make sequelize

if [ "${NODEFONY_ENVIRONMENT}" == "dev" ]
then
	# DEVEOLPPEMENT
	echo "RUN NODEFONY CONTAINER MODE :${NODEFONY_ENVIRONMENT}"
	./nodefony_dev
else
	# PRODUCTION 
	echo "RUN NODEFONY CONTAINER MODE :${NODEFONY_ENVIRONMENT}"
	make asset
	./node_modules/pm2/bin/pm2 update
	./nodefony_pm2 
fi
