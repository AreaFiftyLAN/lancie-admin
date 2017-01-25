FROM nginx:alpine

RUN apk --no-cache add nodejs-lts git

WORKDIR /tmp
ADD . ./

RUN npm install -g yarn bower
RUN yarn
RUN bower --allow-root install
RUN npm run build optimize-images
RUN npm run build

COPY ./build/bundled/. /usr/share/nginx/html

RUN rm -r * .*
RUN apt del nodejs-lts git

EXPOSE 80 443
