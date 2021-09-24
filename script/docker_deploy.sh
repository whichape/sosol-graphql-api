
# Docker Build
docker build --file Dockerfile --tag "sosol/terraform-sosol-backend:test" .

# Docker Tag
docker tag "sosol/terraform-sosol-backend:test" "sosol/terraform-sosol-backend:latest"

# Docker run locally
# docker run --name my-container --hostname=0.0.0.0 --publish-all=true --privileged=true -t -i -d -e "APP_PORT=5000" -e "APP_HOME=/usr/src/app/" -e "APP_SECRET_KEY=nC5CfQ@d2jNvqrba" -e "FLASK_APP=app" -e "FLASK_ENV=dev" -e "POSTGRES_DATABASE=postgresdb" -e "POSTGRES_ENDPOINT=xxxx:5432" -e "POSTGRES_PASSWORD=xxx" -e "POSTGRES_USER=postgres" "****/terraform-flask-postgres-docker-example:latest"

# Docker push
docker push "sosol/terraform-sosol-backend:latest"
