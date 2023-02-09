module "alb" {
  source = "../../../../modules/alb"
  alb_name       = "comento-pt-public"
  vpc_id = "vpc-0e794de4b37c8f237"
  public_subnets = [
    "subnet-021f4ae7a020bb6d8",
    "subnet-0665801dd7d57f404",
  ]

}