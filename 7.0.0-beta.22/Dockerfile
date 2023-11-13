FROM  node:latest

LABEL maintainer "Christophe CAMENSULI <ccamensuli@gmail.com>"
LABEL net.nodefony.version="7.0.0-beta.22"
RUN apt-get update

COPY entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/entrypoint.sh \
   && ln -s /usr/local/bin/entrypoint.sh /

USER node
ENV "NODEFONY_ENV_APP" "production"
ENV "NODEFONY_DEBUG" "false"
ENV "NODEFONY_ORM" "sequelize"

WORKDIR /home/node
RUN  git clone https://github.com/nodefony/nodefony-starter.git  && cd nodefony-starter && git checkout -b v7.0.0-beta.22 && npm install -f && npm run build && npm run compile

EXPOSE 5151 5152 1318
VOLUME ["/home/node/nodefony-starter/tmp","/home/node/nodefony-starter/src", "/home/node/nodefony-starter/app", "/home/node/nodefony-starter/config"]

ENTRYPOINT ["entrypoint.sh"]
