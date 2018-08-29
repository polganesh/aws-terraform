terraform {
  backend "local" {
    path = "../../../../tfstate/s3-example/dev/terrformstate.tfstate"
  }
}