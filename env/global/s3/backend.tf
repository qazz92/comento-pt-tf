terraform {
  backend "s3" {
    bucket  = "tfstate.rokhun.com"
    key     = "global/s3/terraform.state"
    region  = "ap-northeast-2"
    profile = "rokhun"
  }
}
