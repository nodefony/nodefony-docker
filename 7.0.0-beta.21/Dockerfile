FROM  node:latest

LABEL maintainer "Christophe CAMENSULI <ccamensuli@gmail.com>"
LABEL net.nodefony.version="7.0.0-beta.21"

RUN apt-get update

RUN git clone https://github.com/nodefony/nodefony-starter.git

WORKDIR /nodefony-starter
RUN git checkout -b v7.0.0-beta.21

RUN npm install
RUN npm run build
RUN  npm run compile

EXPOSE 5151 5152 1318

ENV "NODEFONY_ENVIRONMENT" "prod"
ENV "NODEFONY_DEBUG" "false"
ENV "NODEFONY_ORM" "sequelize"

COPY entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/entrypoint.sh \
   && ln -s /usr/local/bin/entrypoint.sh /

VOLUME ["/nodefony-starter/tmp", "/nodefony-starter/app", "/nodefony-starter/bundles", "/nodefony-starter/config"]

ENTRYPOINT ["entrypoint.sh"]
