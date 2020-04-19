FROM node:12.16.2

LABEL "version"="1.0.0"

ENV APP_ROOT /src

RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}
ADD . ${APP_ROOT}
 
RUN npm install
RUN npm run build
ENV HOST 0.0.0.0