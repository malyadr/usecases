terraform {
  backend "gcs" {
    bucket = "tf-state-dev-bkt"
    prefix = "terraform/state/dev"
  }
}
