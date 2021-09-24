[
   {
      "essential": true,
      "name":"sosol-app",
      "image":"${REPOSITORY_URL}",
      "portMappings":[
         {
            "containerPort":"${PORT}",
            "hostPort":"${PORT}",
            "protocol":"tcp"
         }
      ],
      "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "${CLOUDWATCH_GROUP}",
            "awslogs-region": "${AWS_REGION}",
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
            "name":"NODE_ENV",
            "value":"${NODE_ENV}"
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
            "name":"JWT_SECRET",
            "value":"${JWT_SECRET}"
         }
      ]
   }
]