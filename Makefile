DISTRIB := $(shell uname)
VERBOSE = 0
NODE_VERSION := $(shell node -v)

VERSION := $(subst v,,$(subst .,,$(NODE_VERSION)))
#$(error $(VERSION))
VERSION := $(shell expr $(VERSION) )

NODEFONY_VERSION = 5.0.9

all:  compose

clean-image :
	docker rmi nodefony/docker-nodefony  ;

publish: clean-image image
	@echo "";
	@echo "############################################################" ;
	@echo "#       DOCKER PUBLISH NODEFONY   $(NODEFONY_VERSION)      #" ;
	@echo "############################################################" ;
	@echo "";

	#-@$(shell docker rmi $(shell docker images -q) )
	#docker  images | grep nodefony/docker-nodefony | cut  -d " " -f 18
	#docker tag nodefony/docker-nodefony nodefony/docker-nodefony:$(NODEFONY_VERSION)
	#docker tag nodefony/docker-nodefony nodefony/docker-nodefony:latest
	#@docker images ;
	#docker login ;
	#docker push nodefony/docker-nodefony:$(NODEFONY_VERSION)
	#docker push nodefony/docker-nodefony:latest

install:
	docker pull nodefony/docker-nodefony

ls-l:
	#docker exec -it docker-nodefony /bin/bash
	docker exec -it nodefony  ls -l

image:
	@echo "";
	@echo "#########################################" ;
	@echo "#         IMAGE DOCKER NODEFONY         #" ;
	@echo "#########################################" ;
	@echo "";
	docker build  -t nodefony/docker-nodefony ./$(NODEFONY_VERSION)/

run:
	## WARNING ON MACOS docker host is actually on a VM  for binding  you could use virtualbox's port forwarding feature
	#docker run --rm -dit --publish 127.0.0.1:5151:5151  --publish 127.0.0.1:5152:5152  -p 1318:1318 -p 1315:1315 -p 1316:1316 --name=nodefony nodefony/docker-nodefony
	#docker run --rm -dit -p 5152:5152 -p 5151:5151 -p 1318:1318 --name=nodefony nodefony/docker-nodefony
	#docker run --rm -it -p 5152:5152 -p 5151:5151 -p 1318:1318 -v /Users/christophecamensuli/repository/nodefony-core/app:/nodefony/app --name=nodefony nodefony/docker-nodefony
	docker run --rm -it -p 5152:5152 -p 5151:5151 -p 1318:1318 --name=nodefony nodefony/docker-nodefony

stop:
	-@docker stop nodefony

rm:
	-@docker rm -f nodefony

port:
	docker port nodefony

ps:
	docker ps -a;

network:
	docker  network ls ;

network-clean:
	docker  network prune ;

volume:
	docker  volume ls ;

volume-clean:
	docker  volume prune ;

inspect:
	@docker inspect nodefony

clean-all:	clean-container clean  clean-images

clean:		rm network-clean volume-clean

clean-container:
	-@$(shell docker rm $(shell docker ps -a -q) )

clean-images:
	-@$(shell docker rmi $(shell docker images -q) )

# COMPOSER

compose:
	@echo "";
	@echo "#########################################" ;
	@echo "#       DOCKER COMPOSER NODEFONY        #" ;
	@echo "#########################################" ;
	@echo "";
	docker-compose up;

compose-build:
	@echo "";
	@echo "#########################################" ;
	@echo "#         DOCKER COMPOSER BUILD         #" ;
	@echo "#########################################" ;
	@echo "";
	docker-compose build ;

compose-start:
	@echo "";
	@echo "#########################################" ;
	@echo "#    DOCKER COMPOSER NODEFONY START     #" ;
	@echo "#########################################" ;
	@echo "";
	docker-compose up -d;

compose-stop:
	@echo "";
	@echo "#########################################" ;
	@echo "#    DOCKER COMPOSER NODEFONY STOP      #" ;
	@echo "#########################################" ;
	@echo "";
	docker-compose stop ;

compose-rm:
	@echo "";
	@echo "#########################################" ;
	@echo "#    DOCKER COMPOSER NODEFONY REMOVE    #" ;
	@echo "#########################################" ;
	@echo "";
	docker-compose rm ;

compose-ip:
	@echo "";
	@echo "#########################################" ;
	@echo "#         DOCKER CONTAINER NODEFONY     #" ;
	@echo "#########################################" ;
	@echo "";
	@docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nodefony
	@echo "";

	@echo "";
	@echo "#########################################" ;
	@echo "#         DOCKER CONTAINER NGINX        #" ;
	@echo "#########################################" ;
	@echo "";
	@docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx
	@echo "";

.EXPORT_ALL_VARIABLES:
.PHONY: compose
