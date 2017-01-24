FROM ngnix:alpine

RUN curl -o- https://yarnpkg.com/install.sh | bash

RUN mkdir -p /app
WORKDIR /app

RUN yarn
RUN yarn global add bower
RUN bower install
RUN yarn run build optimize-images
RUN yarn run build

COPY ./build/bundled/. /app/.

EXPOSE 443
