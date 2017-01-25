FROM nginx:alpine

RUN apk --no-cache add nodejs-lts git

WORKDIR /tmp/app
ADD . ./

RUN npm install -g yarn bower
RUN yarn
RUN bower --allow-root install
RUN yarn run build optimize-images
RUN yarn run build

COPY ./build/bundled/. /usr/share/nginx/html

RUN rm -r /tmp/app
RUN apk del nodejs-lts git

EXPOSE 80 443
