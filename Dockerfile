FROM nginx:alpine

WORKDIR /tmp/app
ADD . ./

RUN apk --no-cache add nodejs-lts git &&\
    npm install -g yarn bower && \
    yarn && \
    bower --allow-root install && \
    yarn run build optimize-images && \
    yarn run build && \
    cp -r ./build/bundled/. /usr/share/nginx/html && \
    rm -r /tmp/app && \
    apk del nodejs-lts git

EXPOSE 80 443
