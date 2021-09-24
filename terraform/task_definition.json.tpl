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
            "name":"SOSOL_APP",
            "value":"${SOSOL_APP}"
         },
         {
            "name":"SOSOL_ENV",
            "value":"${SOSOL_ENV}"
         },
         {
            "name":"APP_HOME",
            "value":"${SOSOL_APP_HOME}"
         },
         {
            "name":"APP_PORT",
            "value":"${SOSOL_APP_PORT}"
         },
         {
            "name":"APP_SECRET_KEY",
            "value":"${APP_SECRET_KEY}"
         }
      ]
   }
]