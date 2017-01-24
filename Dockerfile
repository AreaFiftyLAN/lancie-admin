FROM nginx:alpine

RUN apk --no-cache add curl bash tar
RUN curl -o- -L https://yarnpkg.com/install.sh | sh

RUN mkdir -p /app
WORKDIR /app

RUN ~/.yarn/bin/yarnpkg
RUN ~/.yarn/bin/yarnpkg global add bower
RUN bower install
RUN ~/.yarn/bin/yarnpkg run build optimize-images
RUN ~/.yarn/bin/yarnpkg run build

COPY ./build/bundled/. /app/.

EXPOSE 443
