terraform {
  backend "local" {
    path = "../../../../tfstate/nonprod-env/thworks/dev/tfs.tfstate"
  }
}