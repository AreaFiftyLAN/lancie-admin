FROM nginx:alpine

WORKDIR /tmp/app
ADD . ./

RUN sh ./build.sh

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
