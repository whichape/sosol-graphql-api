# create the ECS cluster
resource "aws_ecs_cluster" "fp_ecs_cluster" {
  name = "sosol-app"

  tags = {
    Name = "sosol-app"
  }
}