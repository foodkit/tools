FROM node:carbon

ARG nodeEnv=production

# Best practice: https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md#environment-variables
ENV NODE_ENV=$nodeEnv

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY /dist ./dist

EXPOSE 8080

# Best practice: https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md#non-root-user
USER node

# Best practise: https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md#environment-variables
CMD [ "node", "dist/server.js" ]