FROM  node:6.9

 LABEL maintainer "Christophe CAMENSULI <ccamensuli@gmail.com>"
 LABEL net.nodefony.version="2.1.0"

 RUN apt-get update
 RUN apt-get -y install vim
 RUN apt-get -y install curl
 RUN apt-get -y install rsync
 RUN apt-get -y install sqlite3
 RUN apt-get -y install git
 RUN apt-get -y install mariadb-client-10.0

 RUN mkdir /docker
 COPY /nodefony /docker   
 COPY entrypoint.sh /usr/local/bin/

 RUN git clone https://github.com/nodefony/nodefony.git

 WORKDIR /nodefony
 RUN git checkout -b v2.1.0 v2.1.0-beta

 RUN make docker-build

 EXPOSE 5151 5152 1315 1316 1318

 ENV "NODEFONY_ENVIRONMENT" "prod"
 ENTRYPOINT ["entrypoint.sh"]

