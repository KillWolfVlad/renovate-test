################################################################################

ARG NODEJS_IMAGE=node:16.14.2-alpine3.15

################################################################################

FROM ${NODEJS_IMAGE} as workspaces

WORKDIR /workspaces

COPY . .

USER node

################################################################################

FROM workspaces AS migrator

CMD ["yarn", "run", "start:migrator:prod"]

################################################################################

FROM workspaces AS app

EXPOSE 8080

CMD ["yarn", "run", "start:prod"]
