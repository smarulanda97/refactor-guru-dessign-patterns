FROM node:16

ENV NPM_CONFIG_LOGLEVEL info

RUN mkdir -p /home/node/app/solid
RUN mkdir -p /home/node/app/patterns

WORKDIR /home/node/app

RUN npm install -g ts-node typescript '@types/node'

ENTRYPOINT ["ts-node"]