FROM node:12 AS builder
WORKDIR /src
COPY . .
RUN docker/dockerbuild.sh

FROM wisvch/nginx
COPY --from=builder /src/build/ /srv/
