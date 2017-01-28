FROM nginx:alpine

WORKDIR /tmp/app
ADD . ./

COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

RUN sh ./build.sh
