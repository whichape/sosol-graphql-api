FROM node:16.10.0

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

RUN mkdir -p /app
WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]

RUN npm -v
RUN npm install

COPY . .

RUN ls -la /app/node_modules/graphql-yoga

EXPOSE 7777

RUN npm run prisma:gen
CMD [ "node", "src/server.js" ]