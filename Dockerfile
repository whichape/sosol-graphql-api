FROM node:14-alpine

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

RUN mkdir -p /app
WORKDIR /app
COPY package.json package-lock.json ./

RUN node -v
RUN npm i

COPY . .

EXPOSE 7777

RUN npm run prisma:gen
CMD npm run start