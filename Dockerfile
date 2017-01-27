FROM nginx:alpine

WORKDIR /tmp/app
ADD . ./

RUN sh ./build.sh

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
