terraform {
  backend "local" {
    path = "../../../tfstate/elasticSearch-example/dev/terrformstate.tfstate"
  }
}