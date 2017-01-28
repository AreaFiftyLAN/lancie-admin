FROM nginx:alpine

WORKDIR /tmp/app
ADD . ./

RUN sh ./build.sh

COPY default.conf /etc/nginx/conf.d/default.conf
