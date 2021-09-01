docker-compose stop
docker-compose build
docker-compose up -d
docker top backend_postgres_1
npm run docker:prisma