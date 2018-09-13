terraform {
  backend "local" {
    path = "../../../../tfstate/ecs/dev/tfstate.tfstate"
  }
}