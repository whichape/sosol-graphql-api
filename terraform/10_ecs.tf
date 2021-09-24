# create the ECS cluster
resource "aws_ecs_cluster" "fp-ecs-cluster" {
  name = "sosol-app"

  tags = {
    Name = "sosol-app"
  }
}