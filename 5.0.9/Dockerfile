FROM  node:latest

 LABEL maintainer "Christophe CAMENSULI <ccamensuli@gmail.com>"
 LABEL net.nodefony.version="5.0.9"

 RUN apt-get update

 RUN git clone https://github.com/nodefony/nodefony.git

 WORKDIR /nodefony
 RUN git checkout -b v5.0.9

 RUN npm install
 RUN npm run build

 EXPOSE 5151 5152 1318

 ENV "NODEFONY_ENVIRONMENT" "prod"
 ENV "NODEFONY_DEBUG" "false"
 ENV "NODEFONY_ORM" "sequelize"

 COPY entrypoint.sh /usr/local/bin/
 RUN chmod 777 /usr/local/bin/entrypoint.sh \
    && ln -s /usr/local/bin/entrypoint.sh /

 VOLUME ["/nodefony/tmp", "/nodefony/app", "/nodefony/bundles", "/nodefony/config"]

 ENTRYPOINT ["entrypoint.sh"]
