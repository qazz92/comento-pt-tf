terraform {
  backend "s3" {
    bucket  = "tfstate.rokhun.com"
    key     = "alpha/vpc/terraform.state"
    region  = "ap-northeast-2"
    profile = "rokhun"
  }
}
