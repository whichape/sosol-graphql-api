[
   {
      "essential": true,
      "name":"sosol-app",
      "image":"${REPOSITORY_URL}",
      "portMappings":[
         {
            "containerPort":7777,
            "hostPort":7777,
            "protocol":"tcp"
         }
      ],
      "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "${CLOUDWATCH_GROUP}",
            "awslogs-region": "${REGION}",
            "awslogs-stream-prefix": "ecs"
          }
        },
      "environment":[
         {
            "name":"POSTGRES_USER",
            "value":"${POSTGRES_USERNAME}"
         },
         {
            "name":"POSTGRES_PASSWORD",
            "value":"${POSTGRES_PASSWD}"
         },
         {
            "name":"POSTGRES_ENDPOINT",
            "value":"${POSTGRES_ENDPOINT}"
         },
         {
            "name":"POSTGRES_DATABASE",
            "value":"${POSTGRES_DATABASE}"
         },
         {
            "name":"sosol_APP",
            "value":"${sosol_APP}"
         },
         {
            "name":"sosol_ENV",
            "value":"${sosol_ENV}"
         },
         {
            "name":"APP_HOME",
            "value":"${sosol_APP_HOME}"
         },
         {
            "name":"APP_PORT",
            "value":"${sosol_APP_PORT}"
         },
         {
            "name":"APP_SECRET_KEY",
            "value":"${APP_SECRET_KEY}"
         }
      ]
   }
]