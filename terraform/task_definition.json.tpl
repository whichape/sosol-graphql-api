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
            "name":"DATABASE_URL",
            "value":"${DATABASE_URL}"
         },
         {
            "name":"PORT",
            "value":"${PORT}"
         },
         {
            "name":"NODE_ENV",
            "value":"${NODE_ENV}"
         },
         {
            "name":"JWT_SECRET",
            "value":"${JWT_SECRET}"
         },
         {
            "name":"AWS_ACCESS_KEY_ID",
            "value":"${AWS_ACCESS_KEY_ID}"
         },
         {
            "name":"AWS_SECRET_KEY",
            "value":"${AWS_SECRET_KEY}"
         },
         {
            "name":"AWS_BUCKET_NAME",
            "value":"${AWS_BUCKET_NAME}"
         },
         {
            "name":"AWS_REGION",
            "value":"${AWS_REGION}"
         }
      ]
   }
]