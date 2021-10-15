# Sosol Graph API α

The API currently deployed to AWS that runs sosol.
## Quickstart

- Install docker and docker-compose on your system
- Copy `.env.example` to `.env`
- Run `npm run docker:build:dev` to build and get the backend up and running
- Run `npm run docker:dev` to open logs
- App is deployed and running on localhost:7777

NB: you can create an AWS S3 container, using aws-cli and replace the env values for dev file storage, or use [localstack](https://github.com/localstack/localstack) in your docker env to mock S3 for working image uploads.

## Healthcheck

You can run a healthcheck by opening `localhost:7777` and executing a GraphQL request in the GUI:

```GraphQL
query healthCheck {
  healthCheck
}
```

## Prisma migrations

Prisma migrations need to be run locally by setting the .env file accordingly and the running `npx prisma migrate dev` or `npx prisma migrate deploy`.
