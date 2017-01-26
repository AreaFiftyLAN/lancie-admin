FROM nginx:alpine

WORKDIR /tmp/app
ADD . ./

RUN apk --no-cache add nodejs-lts git && \
    npm install -g yarn bower && \
    yarn && \
    bower --allow-root install && \
    yarn run build optimize-images && \
    yarn run build && \
    cp -r ./build/bundled/. /usr/share/nginx/html && \
    yarn cache clean && \
    bower --allow-root cache clean && \
    npm cache clean && \
    npm uninstall -g yarn bower && \
    rm -r /tmp && \
    apk del nodejs-lts git

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
