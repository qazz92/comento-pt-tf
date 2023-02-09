module "cluster" {
  source = "../../../../modules/ecs/cluster"
  cluster_name = "comento-pt"
  container_insights = false
}

module "api" {
  source = "../../../../modules/ecs/service"
  cluster_arn = module.cluster.arn
  private_subnets = [
    "subnet-050f7b22529e9eceb",
    "subnet-00776bc17d7114e5d",
  ]
  cw_retention_in_days = 1
  deployment_maximum_percent = 200
  deployment_minimum_healthy_percent = 100
  health_check_grace_period_seconds = 0
  ecs_cpu = 256
  ecs_mem = 512
  use_fargate_spot = true
  on_demand_count = 1
  on_demand_weight = 0
  spot_count = 0
  spot_weight = 1
  service_name = "nginx"
  service_image = "nginx:stable-alpine"
  service_port = 80
  has_task_role_custom_policy = false
  task_role_custom_policy = ""
  load_balancer_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:216066129448:loadbalancer/app/comento-pt-public-alb/df70bbf38aa03d71"
  service_host = "*"
  vpc_id = "vpc-0e794de4b37c8f237"
}