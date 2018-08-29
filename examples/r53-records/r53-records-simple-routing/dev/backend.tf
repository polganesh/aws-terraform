terraform {
  backend "local" {
    path = "../../../../../tfstate/r53-records-simple-routing/dev/terraformstate.tfstate"
  }
}