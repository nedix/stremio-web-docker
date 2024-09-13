ARG ALPINE_VERSION=3.20
ARG NODE_VERSION=20.17.0
ARG STREMIO_WEB_VERSION=5.0.0-beta.8

FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION}

ARG STREMIO_WEB_VERSION

WORKDIR /build/stremio-web

RUN npm i -g \
        serve \
    && wget -qO- "https://github.com/Stremio/stremio-web/releases/download/v${STREMIO_WEB_VERSION}/stremio-web.zip" \
    | unzip - \
    && mkdir -p /var/www/html \
    && mv -T build /var/www/html

WORKDIR /var/www/html

ENTRYPOINT ["npm", "exec", "serve"]

EXPOSE 3000
