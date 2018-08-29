terraform {
  backend "local" {
    path = "../../../../../tfstate/r53-records-weighted-routing/dev/terraformstate.tfstate"
  }
}