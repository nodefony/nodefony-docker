# docker-nodefony

[![dockeri.co](http://dockeri.co/image/nodefony/docker-nodefony)](https://hub.docker.com/r/nodefony/docker-nodefony/)

Docker Image for nodefony

## What is nodefony?

Nodefony is Node.js full-stack web framework.

Nodefony can be used to develop a complete solution to create a Fullstack Web Application, Secure Api, or Microservices.

## <a name="features"></a>Nodefony features :

-   Servers  ([http(s)](https://nodejs.org/dist/latest-v8.x/docs/api/https.html), [websocket(s)](https://github.com/theturtle32/WebSocket-Node), statics, sockjs)
-   [HTTP2](https://nodejs.org/api/http2.html) ready node module provides an implementation of the HTTP/2 (push server ready).
-   Dynamics routing
-   ORM [Sequelize](http://docs.sequelizejs.com)
-   ORM [mongoose](http://mongoosejs.com/index.html)
-   Simple Databases Services connections (Redis, Mongo, Elasticsearch, mysql, sqlite ...).
-   MVC Templating Server Side ([Twig](https://github.com/twigjs/twig.js))
-   Notion of real-time context in Action Controller (websocket).
-   Notion of synchronous or asynchronous execution in Action Controller (Promise, Async, Await).
-   Services Containers, Dependency Injection (Design Patterns)
-   Sessions Manager (ORM, Memcached)
-   Authentication Manager (Digest, Basic, oAuth, Local, ldap, jwt, openid, passportjs)
-   WAF ( Web application firewall )
-   Cross-Origin Resource Sharing ([CORS](https://www.w3.org/TR/cors/))
-   Production Management ([PM2](https://github.com/Unitech/pm2/))
-   RealTime API ([Bayeux Protocol](http://autogrowsystems.github.io/faye-go/))
-   Webpack Assets management (Like WDS with HMR hot module Replacement)
-   C++ Addons (Binding in Bundle)
-   Translations
-   CLI (Command Line Interface)
-   Monitororing , Debug Bar
-   Unit Test Api in framework context ([MOCHA](https://mochajs.org/))

**Nodefony assimilates into the ecosystem of node.js with services like** :

-   [WEBPACK](https://webpack.js.org/) Module bundler for assets management of application .
-   [SockJS](https://github.com/sockjs) Server ( Like WDS 'Webpack Dev Server' and HMR management )
-   [WATCHER](https://nodejs.org/docs/latest/api/fs.html#fs_fs_watch_filename_options_listener) node.js for auto reload-files in developement mode .
-   [PM2](http://pm2.keymetrics.io/) Production Process Manager for Node.js .
-   [Passport](http://passportjs.org/) Simple, unobtrusive authentication for Node.js .
-   ~~[Angular](https://github.com/angular/angular-cli) Experimental Bundle Generator ( Angular cli no longer allows the ejection of a webpack config)~~

**Nodefony 7  adds the following features** :

-   [React](https://github.com/facebookincubator/create-react-app) Experimental Bundle Generator ( Now an React Project can be merge into a Nodefony Bundle )
-   [Vue.js](https://vuejs.org) Experimental Bundle Generator ( Now an Vue.js Project can be merge into a Nodefony Bundle )
-   [Api swagger-ui](https://swagger.io/) ( Documentation Api with swagger and openapi AOS3)
-   [Api graphql](https://graphql.org/) ( Documentation Api with graphiql)


Evolution priorities for the next version will focus on robustness, unit testing, documentation and security.

You can follow Nodefony build with github actions at **<https://github.com/nodefony/nodefony/actions>**

## Nodefony implement modules with CommonJS and ECMAScript 6 ( Class, Inheritance ).
The development framework will not be ported to typescript, but will wait for the version with type syntax in Emacsript

**[proposal-type-annotations](https://github.com/tc39/proposal-type-annotations)**


# How to use image nodefony Docker ?

docker pull nodefony/docker-nodefony

# ENV (environment variables)

- NODEFONY_ENVIRONMENT=prod
- NODEFONY_DEBUG=false

### exposing  ports

docker run --rm -it -p 5152:5152 -p 5151:5151 -p 1318:1318 --name=nodefony nodefony/docker-nodefony

### developement
docker run --rm -it -p 5152:5152 -p 5151:5151 -p 1318:1318 -e "NODEFONY_ENVIRONMENT=dev" -e "NODEFONY_DEBUG=true" --name=nodefony nodefony/docker-nodefony

Then you can hit http://localhost:5151 or https://localhost:5152 in your browser.


### exposing  ports ( macosx )


[https://docs.docker.com/docker-for-mac/networking](https://docs.docker.com/docker-for-mac/networking)
